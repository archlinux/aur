# Maintainer : Frikilinux <frikilinux@gmail.com>
# Contributor : peeweep <peeweep at 0x0 dot ee>

pkgname=python-aigpy
_pkgname=aigpy
pkgver=2021.9.10.3
pkgrel=1
pkgdesc="Python Common Lib"
arch=('any')
url="https://github.com/yaronzz/AIGPY"
license=('MIT')
depends=(
  'python-requests'
  'python-colorama'
  'python-mutagen'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")

sha256sums=('838aaaf62efb2a48847f07948cce0dc1a209828807545b914065b25c4e50c38d')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
