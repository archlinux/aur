# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=ytalk
pkgver=3.3.0
pkgrel=2
pkgdesc="A multi-user chat program that works exactly like UNIX's talk."
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/ytalk"
license=('GPL')
depends=('ncurses')
source=("http://ftp.debian.org/debian/pool/main/y/ytalk/${pkgname}_${pkgver}.orig.tar.gz")
md5sums=('c043a8d854638b293a3b645d8600aa38')
sha1sums=('7a988cc6f7ef1ca7499aa54e73ed6db4e7416bc6')
sha256sums=('6ecb34f71f723a7b96f90e411c78dff2735c08dc4228c765f7fdbf8ca48572b4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --bindir=/usr/bin --sysconfdir=/etc --mandir=/usr/share/man
  make 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}

