# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=nzb
pkgver=0.2
pkgrel=1
pkgdesc="A library and graphical Usenet client for nzb based NNTP downloading and streaming"
arch=('i686' 'x86_64')
url="http://www.nzb.fi/"
license=('GPL')
depends=('openssl' 'qt')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('df27606e8e016485a7e9cfb3aa7a2cea9f453d1f26901c02d53731ef0c816497')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  qmake DESTDIR=${pkgdir}/usr/bin
  make

# ChangeLog
  install -D -m644 ${srcdir}/$pkgname-$pkgver/ChangeLog \
    ${pkgdir}/usr/share/doc/$pkgname/ChangeLog
}
