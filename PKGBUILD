# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-x-wr-timezone
_name=${pkgname#python-}
pkgver=0.0.6
pkgrel=1
pkgdesc="Handling of non-standard X-WR-TIMEZONE icalendar property in Python and Command Line"
arch=('any')
url="https://github.com/niccokunzmann/x-wr-timezone"
license=('LGPL-3.0-or-later')
depends=('python-icalendar' 'python-pytz')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pygments' 'python-pytest' 'python-restructuredtext_lint')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4482364cc25f7023cec4f58dfd333bd7a9e4fcb7eb614b9fb15660e78c62572a')

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
