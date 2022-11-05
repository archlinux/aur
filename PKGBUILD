# Maintainer: Evgeniy Alekseev

pkgname=python-pydeps
_pkgname=pydeps
pkgver=1.10.24
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

sha512sums=('98a41ae9934cf1916fd3163c80dd9c60e5b80af631cad4f342adcb5bbf9add95ebb88e9c9ab6bb943ea1435c071548381a7e852b7de8a9c630b5c3db7bee5390')
