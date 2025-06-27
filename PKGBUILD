# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=python-exchange_calendars
_pkgname=exchange_calendars
pkgver=4.10.1
pkgrel=2
pkgdesc="Calendars for various securities exchanges"
arch=('any')
depends=('python-numpy' 'python-pandas' 'python-dateutil' 'python-pytz' 'python-pyluach' 'python-toolz' 'python-korean_lunar_calendar' 'python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
url="https://github.com/gerrymanoim/$_pkgname"
license=('APACHE')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('32885a58557cee82359f8b54f396616fde1ee0df05911f67416934d58bcd13e1')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
