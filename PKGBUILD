# Maintainer: cstamas <cstamas at crysys dot hu>

pkgname=python-dncil
pkgver=1.0.2 
pkgrel=1
pkgdesc="The FLARE team's open-source library to disassemble Common Intermediate Language (CIL) instructions."
url='https://github.com/mandiant/dncil'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-wheel' 'python-installer')
source=(https://github.com/mandiant/dncil/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('2d9d96b2876cccd6d87837bed8478974cf44c49862e55b8dcb6da9e58a630c1a733e623a48bf13a90899ca3e1d0347f5a3a96b6ab5e8c2ffd7a522107fbd9aa6')
b2sums=('c1583175b11d2085fea3c4f53923177d04169479c6e240db4345ddbd7b145e9fb31868072be4d73d6a60af64c7de8d4faf16d2e0dcd58ebf8ef16625b31eb090')

build() {
  cd dncil-${pkgver}
  python setup.py bdist_wheel
}

package_python-dncil() {
  cd dncil-${pkgver}
  python -m installer --no-compile-bytecode --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README* -t "${pkgdir}/usr/share/doc/${pkgname}"
}
