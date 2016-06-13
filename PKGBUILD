#PKGBUILD mantainer: JKA Network <contacto@jkanetwork.com>
pkgname=manpages-es-extra
pkgver=0.8a
pkgrel=1
pkgdesc="manpages extras del sistema traducidas al castellano"
arch=('any')
url="https://launchpad.net/ubuntu/+source/manpages-es-extra"
license=('custom')
options=(!emptydirs)
install="$pkgname.install"
source=(https://launchpad.net/ubuntu/+archive/primary/+files/manpages-es-extra_0.8a.orig.tar.gz)
sha256sums=('5d3831f2524a388790c267f2fb18278f5d90c416e5323f66e4c67e828a4b0072')
PKGEXT=".pkg.tar.xz"
build(){
  cd "$srcdir/$pkgname-$pkgver"
  make gz

}
package(){
  cd "$srcdir/$pkgname-$pkgver"
  make MANDIR=$pkgdir/usr/share/man/es install
  rm $pkgdir/usr/share/man/es/man3/{dlclose,dlerror,dlopen,dlsym}.3.gz
  rm $pkgdir/usr/share/man/es/man5/{acct,host.conf,resolv.conf,resolver}.5.gz
  rm $pkgdir/usr/share/man/es/man8/ld.so.8.gz  
}

