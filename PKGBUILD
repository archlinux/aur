# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=python-fast-histogram
_pyname=fast-histogram
pkgver=0.9
pkgrel=1
pkgdesc="Fast 1D and 2D histogram functions in Python"
arch=('i386' 'x86_64')
url="https://github.com/astrofrog/fast-histogram"
license=('CUSTOM')
depends=('python' 'python-numpy')
makedepends=('python-setuptools')
        
source=(https://files.pythonhosted.org/packages/dd/c7/8f6b0748fecd0e002d2c8ca777504ad90777d8877bd1d48a80e71fddeccd/fast-histogram-${pkgver}.tar.gz)
sha256sums=('6325ce42060bb9d1987a3aefffcac45bdd3810bc58ce69716132e23aa49f7a9f')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}
