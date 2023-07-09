# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=python-fast-histogram
_pyname=fast-histogram
pkgver=0.11
pkgrel=1
pkgdesc="Fast 1D and 2D histogram functions in Python"
arch=('i386' 'x86_64')
url="https://github.com/astrofrog/fast-histogram"
license=('CUSTOM')
depends=('python' 'python-numpy')
makedepends=('python-setuptools')
        
source=(https://pypi.io/packages/source/f/${_pyname}/${_pyname}-${pkgver}.tar.gz)
sha256sums=('9acb6fa5b6efd928663008965da186962bdeae20e6d5bbb3b1195dfbd1d906f0')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}
