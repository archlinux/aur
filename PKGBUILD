# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>

pkgname=python-atomicwrites
pkgver=0.1.8
pkgrel=3
pkgdesc="Atomic file writes on POSIX"
arch=('i686' 'x86_64')
url="https://github.com/untitaker/python-atomicwrites"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/untitaker/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0fce96c2f96b3f4d3b2761e1c23af58de1688479bde5b2a925c372984f30b1ec')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

