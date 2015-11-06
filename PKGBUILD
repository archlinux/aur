# Maintainer: Jonathan Kotta <jpkotta AT gmail DOT com>

pkgname=commit-patch
pkgver=2.5.2
pkgrel=1
pkgdesc="Commit partial patches to version control"
arch=('any')
url="http://www.porkrind.org/commit-patch/"
license=('GPL2')
depends=('perl' 'patch' 'patchutils' 'perl-ipc-run')
optdepends=('git' 'mercurial' 'subversion' 'cvs' 'darcs' 'bzr' 'monotone')
conflicts=()
provides=()
source=(http://www.porkrind.org/commit-patch/commit-patch-${pkgver}.tar.gz)
md5sums=('cedddd82eb0b6f0f1639d6b503f8e31c')

prepare() {
  sed -i s%PREFIX=.*%PREFIX="$pkgdir"/usr% "$srcdir"/commit-patch-${pkgver}/Makefile
}

package() {
  cd "$srcdir"/commit-patch-${pkgver}
  
  make install
}
