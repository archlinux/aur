# Maintainer: Patrick Günther <info@paddybu.de>

pkgname=xmds
pkgver=3.1.0
pkgrel=1
pkgdesc="A fast integrator of stochastic partial differential equations"
arch=('any')
url="http://xmds.org/"
license=('GPL2')
depends=('python'
         'hdf5'
         'fftw'
         'python-numpy'
         'python-cheetah3'
         'python-mpmath'
         'python-lxml')
makedepends=('gcc' 'python-setuptools')
optdepends=('openmpi')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('SKIP')

package() {
  cd "$srcdir"/${pkgname}-${pkgver}
  ./setup.py develop --prefix="${pkgdir}/usr"
  rm "${pkgdir}/usr/bin/f2py"
  rm "${pkgdir}/usr/bin/f2py3"
  rm "${pkgdir}/usr/bin/f2py3.10"
}
