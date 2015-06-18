# Maintainer James W. Barnett <jbarnet4 at tulane dot edu>
pkgname=python2-pymbar-git
pkgver=r363.318de3d
pkgrel=1
pkgdesc="Python implementation of the multistate Bennett acceptance ratio (MBAR) method for estimating expectations and free energy differences. "
arch=('i686' 'x86_64')
url="https://github.com/choderalab/pymbar"
license=('LGPL')
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-six')
optdepends=('python2-nose: nosetests')
makedepends=('git')
source=('git://github.com/choderalab/pymbar.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/pymbar"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/pymbar"
    python2 setup.py install --root=$pkgdir || return 1
}
