# Maintainer: Tom K <tomk@runbox.com>

pkgname=gnu-netcat
pkgver=0.7.1
pkgrel=7
pkgdesc="GNU rewrite of netcat, the network piping application"
depends=('glibc' 'texinfo')
arch=('x86_64')
url="http://netcat.sourceforge.net/"
license=('GPL')
replaces=('netcat')
provides=('netcat')
source=("http://downloads.sourceforge.net/sourceforge/netcat/netcat-$pkgver.tar.bz2")
md5sums=('0a29eff1736ddb5effd0b1ec1f6fe0ef')

build() {
  cd "${srcdir}/netcat-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info
  make
}

package() {
  cd "${srcdir}/netcat-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
