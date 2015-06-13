# Modified from original gmpc pkgbuild created by tobias <tobias@archlinux.org>
# Contributor: Lukas Miczka <lukascpu@gmail.com>

pkgname=gmpc-lyricwiki
pkgver=11.8.16
pkgrel=4
pkgdesc="A new plugin that uses the REST api of lyricwiki to fetch lyrics."
arch=(i686 x86_64)
url="http://gmpc.wikia.com/"
license="GPL"
depends=('libmpd>=0.20.0' 'libxml2' 'gmpc>=11.8.16')
makedepends=('intltool')
source=(http://download.sarine.nl/Programs/gmpc/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('a5738460c41ab8ed39db7afccd5a19b0')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver
  make DESTDIR=${pkgdir} install
}
