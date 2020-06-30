# Maintainer: Shakib <hello@shakib.tech>
pkgname=local-by-flywheel-bin
pkgver=5.6.2
pkgrel=1
pkgdesc="A program to create a local WordPress development environment."
arch=('x86_64')
url="https://localbyflywheel.com/"
license=('freemium')
makedepends=('rpmextract')
depends=(
  'numactl'
  'ncurses5-compat-libs'
  'libaio'
  'nettle6'
)
options=('emptydirs')
source=("https://cdn.localwp.com/releases-stable/5.6.2+4213/local-5.6.2-linux.rpm")
sha1sums=('cbb9e2488f727986e24b98e501a0ae40d96b8525')

package() {
rpmextract.sh ../local-5-6-2-linux.rpm
mv $srcdir/usr $pkgdir/ # /usr & /opt are top-level dirs in the package
mv $srcdir/opt $pkgdir/ 
cd $pkgdir/
}
