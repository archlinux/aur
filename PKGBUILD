# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>

pkgname=python-ebaysdk
_pkgname=ebaysdk-python
pkgver=2.2.0
pkgrel=3
pkgdesc="eBay SDK for Python"
url="https://github.com/timotheus/ebaysdk-python"
arch=('any')
license=('CDDL')
depends=('python-lxml' 'python-requests')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aaf2b04deb504676deaa9915f0993d37f5fd883929b6247d35f13654f6fa9594')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" -O1 --skip-build
  rm -r "$pkgdir"/usr/lib/python*/site-packages/{samples,tests}
}
