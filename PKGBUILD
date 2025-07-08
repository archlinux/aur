# Maintainer: Max Lübke <maxluebke(at)gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libhtp
pkgver=0.5.51
pkgrel=1
pkgdesc="Security-aware parser for the HTTP protocol and the related bits and pieces."
arch=('i686' 'x86_64')
url="https://github.com/OISF/libhtp"
license=('BSD-3-Clause')
depends=('zlib')
source=($pkgname-$pkgver.tar.gz::https://github.com/ironbee/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('699475c2e512d5af05312e808f1f759a5d3c4cb154e73d82eaa6906ceacfaeb4')

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
