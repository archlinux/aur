# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>

pkgname=python-atomicwrites
pkgver=0.1.5
pkgrel=1
pkgdesc="Atomic file writes on POSIX"
arch=('i686' 'x86_64')
url="https://github.com/untitaker/python-atomicwrites"
license=('MIT')
makedepends=('python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/untitaker/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('393c26e3e4e69ebd09eeb5af2eb02feb97d49f9b75f40c4614d776cfa72b7323')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

