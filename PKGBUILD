# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=dvdrtools
pkgver=0.3.1
pkgrel=4
pkgdesc="A fork of cdrtools, with the primary goal of supporting writable DVD drives"
arch=('x86_64')
url="http://savannah.nongnu.org/projects/dvdrtools/"
license=('GPL')
depends=('file' 'bash')
makedepends=('transcode')
optdepends=('transcode: video/DVD ripper and encoder for the terminal/console')
conflicts=('cdrkit')
source=(https://sources.archlinux.org/other/dvdrtools/$pkgname-$pkgver.tar.gz)
md5sums=('5707b7e877b853e258cd738938833006')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
