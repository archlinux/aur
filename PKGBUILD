# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Alois Nespor <alois.nespor@gmail.com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=ogmrip-video-copy
pkgver=0.4
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="This plugin enables the extraction of a video title without any encoding."
url="http://ogmrip.sourceforge.net/"
license=('LGPL')
groups=('ogmrip')
depends=('ogmrip>=0.13' 'mplayer>=0.92')
source=("http://downloads.sourceforge.net/sourceforge/ogmrip/$pkgname-$pkgver.tar.gz"
	"http://sourceforge.net/projects/ogmrip/files/${pkgname}/${pkgver}/README")
build(){
  cd "$srcdir/$pkgname-$pkgver"
#  sed -i 's/\(-Wall \)-Werror /\1/g' ./configure || return 1
  ./configure --prefix=/usr
  make
}
package(){
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm0644 README ${pkgdir}/usr/share/ogmrip-video-copy/README
}
md5sums=('09068727de2f756f360bc5c2e06f016d'
         'e60354c51110019a4dffdd1bb1867f29')
