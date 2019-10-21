# Maintainer: charlie137 <slowdive@me.com>
# Contributor: charlie137 <slowdive@me.com>
# Based on PKGBUILD from dashcore maintained by pizzaman

pkgname='axecore'
pkgver=1.4.1
pkgrel=1
pkgdesc="Axe Core (AXE) is an open source cryptocurrency."
arch=('x86_64')
url="https://axerunners.com/"
license=('MIT')
depends=('qt5-base' 'boost' 'boost-libs' 'miniupnpc' 'openssl' 'qrencode')
makedepends=('autoconf' 'automake' 'binutils' 'gcc' 'libtool' 'make' 'pkg-config' 'protobuf' 'qt5-tools')
provides=('axed' 'axe-qt' 'axe-cli' 'axe-tx')
source=('axe256.png'
  'axe-qt.desktop'
  'COPYING'
  "https://github.com/axerunners/axe/releases/download/v${pkgver}/${pkgname}-${pkgver}-$CARCH-linux-gnu.tar.gz"{,.asc})
sha256sums=('06b658f3da983270852b305326042ad563e58aa9ef7fb02002996e8bf6b57130'
            'c6971f66cbbc7acb74885d35d5f7a9b42ada9a95e864f9c71e67d6f9e8264900'
            '9277abe7d3462deb49df07221f13643c2aa55ebc10725c0b9d6d82df8dd7b457'
            '9817ad9d4de78b7651d158c2b2b9d5f449d9688cb128d5a8cf3da72707956845'
            'SKIP')
validpgpkeys=('A9F09620C26999E08EF8F21238E34B740A0E29B7')

package() {
  install -D -m755 "$srcdir/$pkgname-${pkgver%.*}/bin/axe-qt" "$pkgdir/usr/bin/axe-qt"
  install -D -m755 "$srcdir/$pkgname-${pkgver%.*}/bin/axed" "$pkgdir/usr/bin/axed"
  install -D -m755 "$srcdir/$pkgname-${pkgver%.*}/bin/axe-cli" "$pkgdir/usr/bin/axe-cli"
  install -D -m755 "$srcdir/$pkgname-${pkgver%.*}/bin/axe-tx" "$pkgdir/usr/bin/axe-tx"
  install -D -m644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "axe256.png" "$pkgdir/usr/share/pixmaps/axe256.png"
  install -D -m644 "axe-qt.desktop" "$pkgdir/usr/share/applications/axe-qt.desktop"
}
