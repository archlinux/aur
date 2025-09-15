# Maintainer: Max Lübke <maxluebke(at)gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libhtp
pkgver=0.5.52
pkgrel=1
pkgdesc="Security-aware parser for the HTTP protocol and the related bits and pieces."
arch=('i686' 'x86_64')
url="https://github.com/OISF/libhtp"
license=('BSD-3-Clause')
depends=('zlib')
source=($pkgname-$pkgver.tar.gz::https://github.com/ironbee/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('450bee3ee0d8014326a6eb55e1dceaa924849ed369e97869c65c230c916e53cc')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
