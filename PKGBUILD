# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=wireviz
pkgver=0.1
pkgrel=1
pkgdesc='Easily document cables, wiring harnesses and connector pinouts'
arch=('any')
url='https://github.com/formatc1702/WireViz'
license=('GPL3')
depends=('python-graphviz')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('851a6d3a5302b0a41659b7622500c7b8edf7005f3ec88a823f2d207feee7ebf7')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 'README.md' "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
