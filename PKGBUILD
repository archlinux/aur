# Maintainer: Shakib <hello@shakib.tech>
pkgname=local-by-flywheel-bin
pkgver=5.2.6
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
source=("https://local-by-flywheel-flywheel.netdna-ssl.com/releases/5-2-6/local-5-2-6-linux.rpm")
sha1sums=('4a10d92f73997a855ade1261fd926dff3dfe343f')

package() {
rpmextract.sh ../local-5-2-6-linux.rpm
mv $srcdir/usr $pkgdir/ # /usr & /opt are top-level dirs in the package
mv $srcdir/opt $pkgdir/ 
cd $pkgdir/
}
