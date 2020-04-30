# Contributor: xia0er <xia0er@gmail.com> 
pkgname=python-pymc
pkgver=2.3.8
pkgrel=1
pkgdesc="Markov chain Monte Carlo for Python"
arch=('i686' 'x86_64')
url="https://github.com/pymc-devs/pymc"
license=('MIT')
source=("https://github.com/pymc-devs/pymc/archive/v${pkgver}.tar.gz")
makedepends=("gcc-fortran")
sha256sums=('200a28469d574a370fa9b55cd92f112f8ad09f71674bdae514437039e953689b')

package_python2_pymc() {
  depends=('python2-numpy')
  optdepends=('python2-scipy' 'python2-matplotlib' 'python2-pytables' 'ipython2' 'pydot' 'python2-nose')

  cd $srcdir/pymc-$pkgver
  export LDFLAGS="$LDFLAGS -shared"
  python2 setup.py config_fc --fcompiler=gnu95 build
  python2 setup.py install --prefix=/usr --root=$pkgdir || return 1
}

package() {
  depends=('python-numpy')
  optdepends=('python-scipy' 'python-matplotlib' 'python-pytables' 'ipython' 'pydot' 'python-nose')

  cd $srcdir/pymc-$pkgver
  export LDFLAGS="$LDFLAGS -shared"
  python setup.py config_fc --fcompiler=gnu95 build
  python setup.py install --prefix=/usr --root=$pkgdir || return 1
}


