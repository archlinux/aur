# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=python-mpl-scatter-density
_pyname=mpl-scatter-density
pkgver=0.3
pkgrel=1
pkgdesc="Fast scatter density plots for Matplotlib"
arch=('i386' 'x86_64')
url="https://github.com/astrofrog/mpl-scatter-density"
license=('CUSTOM')
depends=('python' 'python-numpy' 'python-matplotlib' 'python-fast-histogram')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/56/03/30d5d902c6ae90b5413e386333532b7b1eaadb096c409fdafc84a3f6c009/${_pyname}-${pkgver}.tar.gz)
sha256sums=('98953172aea8c652570dcc6238bccd20afb69e6ae9594d4679c08e810b658651')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

