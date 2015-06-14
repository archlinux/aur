# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=ogmrip-webm
pkgver=0.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A plugin for OGMRip which adds support for the OGG container"
url="http://ogmrip.sourceforge.net/"
license=('LGPL')
groups=('ogmrip')
depends=('ogmrip>=0.13' 'mkvtoolnix')
source=("http://downloads.sourceforge.net/sourceforge/ogmrip/$pkgname-$pkgver.tar.gz"
	"http://sourceforge.net/projects/ogmrip/files/${pkgname}/${pkgver}/README")
build(){
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}
package(){
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm0644 README ${pkgdir}/usr/share/$pkgname/README
}
md5sums=('69f0d142d7dcca0a9575a18901a2938a'
         'dfab449e242386460992217cbe0015fb')
