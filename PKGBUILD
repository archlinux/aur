# Contributor: Ramana Kumar <firstnameatxrchzdotnet>
pkgname=iceweasel-sync
pkgver=20130304
pkgrel=1
pkgdesc="Speed up Iceweasel using tmpfs"
arch=('i686' 'x86_64')
url="http://wiki.archlinux.org/index.php/Speed-up_Firefox_using_tmpfs"
license=('GPL')
depends=('rsync' 'iceweasel')
makedepends=()
source=($pkgname)
md5sums=('4e7949eaed8f284233d2ecdecc28534c')
build() {
  sed -i "3 c\
LINK=$(ls -d1 ~/.mozilla/firefox/*.default | head -n 1 | xargs basename)
" $pkgname
  install -D $pkgname $pkgdir/usr/bin/$pkgname
  cd $pkgdir/usr/bin
  cp -p $pkgname icesync
  echo "iceweasel-sync && iceweasel && iceweasel-sync" > icesync
}
