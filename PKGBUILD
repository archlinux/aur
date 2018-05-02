# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=python-fast-histogram
_pyname=fast-histogram
pkgver=0.4
pkgrel=1
pkgdesc="Fast 1D and 2D histogram functions in Python"
arch=('i386' 'x86_64')
url="https://github.com/astrofrog/fast-histogram"
license=('CUSTOM')
depends=('python' 'python-numpy')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/dc/6b/3c796520422f5e5940d608ee0a3fff1ad4aa535132c2331581dab4e9a187/fast-histogram-${pkgver}.tar.gz)
sha256sums=('8afcea57930c9ede74ce304a45c5374128485e83c4c9ad143a8778c5ed281419')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}
