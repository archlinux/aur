# Maintainer: Max Lübke <maxluebke(at)gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libhtp
pkgver=0.5.47
pkgrel=1
pkgdesc="Security-aware parser for the HTTP protocol and the related bits and pieces."
arch=('i686' 'x86_64')
url="https://github.com/OISF/libhtp"
license=('BSD-3-Clause')
depends=('zlib')
source=($pkgname-$pkgver.tar.gz::https://github.com/ironbee/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('9792ee19e06352f25204af06cd47b53818b572ef351665eb128259363d1a12fb')

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
