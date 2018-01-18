# Maintainer: kpcyrd <git@rxv.cc>

_pyname="mt940"
pkgname="python-mt-940"
pkgver="4.10.0"
pkgrel=1
pkgdesc="A library to parse MT940 files and returns smart Python collections for statistics and manipulation"
arch=(any)
url="https://github.com/WoLpH/mt940"
license=('BSD')
makedepends=('python-setuptools')
source=("https://github.com/WoLpH/mt940/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('3c04e34ebc9dfbbafd74db9cac367b44b65f8bf01d70c9a08291528f6bf5e2f6f34274319506df5c7e597663ab478270cd4ce2aa700b6d5b436b0223fe3232e9')

build() {
  cd "$_pyname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pyname-$pkgver"
  python setup.py install -O1 --root="${pkgdir}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
