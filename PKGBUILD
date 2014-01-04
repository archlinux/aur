# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: lspci <agm2819[[aaaa]][[tttt]]gmail[[dd]][[oo]][[tt]][[cc]][[oo]][[mm]]>
# Contributor: Mario Blättermann <mariobl@gnome.org>

pkgname=wmbatteries
pkgver=0.1.3
pkgrel=7
pkgdesc="a dockapp based on wmacpiload"
#url="http://dockapps.windowmaker.org/file.php/id/216"
url="http://web.archive.org/web/20121031043911/http://dockapps.windowmaker.org/file.php/id/216"
depends=('libxpm' 'libxext')
license=('GPL')
arch=('i686' 'x86_64')
#source=("http://dockapps.windowmaker.org/download.php/id/394/$pkgname-$pkgver.tar.bz2")
source=("$pkgname-$pkgver.tar.bz2")
md5sums=('ed74f6f0e3945731615e92efed00f4dd')    #md5sums=('ed74f6f0e3945731615e92efed00f4dd')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man || return 1
  make || return 1
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

