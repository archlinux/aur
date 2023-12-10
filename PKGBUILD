# Maintainer: Evgeniy Alekseev

pkgname=python-pydeps
_pkgname=pydeps
pkgver=1.12.17
pkgrel=1
pkgdesc="python module dependency visualization tool"
arch=('any')
url="https://github.com/thebjorn/pydeps"
license=('BSD2')
depends=('python-pyaml' 'python-stdlib-list')
makedepends=('python-setuptools')
source=("https://github.com/thebjorn/pydeps/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('418a40e3729bab2731a0a7b2e6da124944ad00fbd059fc0f59559d1dc920f060258cbbc58ef6db1f70c02528e0a83e087c5503e93d7fde0be389f7e189caf30f')
