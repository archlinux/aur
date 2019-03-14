# Maintainer: kpcyrd <git@rxv.cc>

_pyname="mt940"
pkgname="python-mt-940"
pkgver="4.13.2"
pkgrel=1
pkgdesc="A library to parse MT940 files and returns smart Python collections for statistics and manipulation"
arch=(any)
url="https://github.com/WoLpH/mt940"
license=('BSD')
makedepends=('python-setuptools')
source=("https://github.com/WoLpH/mt940/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('4b7e7efe4f25f6ab0d83dcf4d3746b4263612355ff04e9f2d12bbfdb9e26e2a06aea20732ebf853babd93aec9c74e37cd21b09ff9598bfd13c82d58931921b26')

build() {
  cd "${_pyname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
