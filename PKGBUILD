# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=python-fast-histogram
_pyname=fast-histogram
pkgver=0.5
pkgrel=1
pkgdesc="Fast 1D and 2D histogram functions in Python"
arch=('i386' 'x86_64')
url="https://github.com/astrofrog/fast-histogram"
license=('CUSTOM')
depends=('python' 'python-numpy')
makedepends=('python-setuptools')
        
source=(https://files.pythonhosted.org/packages/5d/65/d070114edb45e3365768ae43a15ab1491dc8ff06ea57384262c22e742dd1/fast-histogram-${pkgver}.tar.gz)
sha256sums=('0e3849e244909aa68e58305ed101c19c8576176eaf90fd5d79215d5ade51a6a7')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}
