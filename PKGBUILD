# Maintainer: Tom K <tomk@runbox.com>

pkgname=gnu-netcat
pkgver=0.7.1
pkgrel=9
pkgdesc="GNU rewrite of netcat, the network piping application"
depends=('glibc' 'texinfo')
arch=('x86_64')
url="http://netcat.sourceforge.net/"
license=('GPL')
replaces=('netcat')
provides=('netcat')
source=("https://downloads.sourceforge.net/sourceforge/netcat/netcat-$pkgver.tar.bz2")
sha256sums=('b55af0bbdf5acc02d1eb6ab18da2acd77a400bafd074489003f3df09676332bb')

build() {
  cd "${srcdir}/netcat-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info
  make
}

package() {
  cd "${srcdir}/netcat-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
