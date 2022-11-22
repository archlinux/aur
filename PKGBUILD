# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-x-wr-timezone
_name=x_wr_timezone
pkgver=0.0.5
pkgrel=1
pkgdesc="Handling of non-standard X-WR-TIMEZONE icalendar property in Python and Command Line"
arch=('any')
url="https://github.com/niccokunzmann/x-wr-timezone"
license=('LGPL3')
depends=('python-icalendar' 'python-pytz')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
#checkdepends=('python-pygments' 'python-pytest' 'python-restructuredtext-lint')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c05cb34b9b58a4607a788db086dcae5766728e4b94e0672870dc5593a6e13fe6')

prepare() {
  cd "$_name-$pkgver"
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

#check() {
#  cd "$_name-$pkgver"
#  pytest
#}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
