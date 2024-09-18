# Maintainer: Lucas Gabriel <g at 11xx dot org>
pkgname=simp1e-amber-hyprcursor
__themename=simp1e-amber-neron
pkgver=0.2
pkgrel=1
pkgdesc="A gold-yellow hyprcursor. Xcursor version also provided as fallback."
arch=('x86_64')
url="https://codeberg.org/useless-utils/simp1e-amber-hyprcursor"
license=('GPL-3.0-or-later')
makedepends=(zstd libarchive)
source=(
$__themename-hyprcursor-$pkgver.tar.zst::https://codeberg.org/useless-utils/$pkgname/releases/download/$pkgver/$__themename-hyprcursor-$pkgver.tar.zst
$__themename-xcursor.tar.zst::https://codeberg.org/useless-utils/$pkgname/releases/download/$pkgver/$__themename-xcursor.tar.zst
)
sha256sums=(
'e4b72e064a8bbb02b04ae1bcc67d87a6c0975418f0b4e9afe253f7139b2c115a'
'94f657af1a84ef2fcf6e4ab6b127b782c63e2d4a12240976b2bc10087543c958'
)

prepare() {
  bsdtar -xf "$srcdir/$__themename-hyprcursor-$pkgver.tar.zst"
  bsdtar -xf "$srcdir/$__themename-xcursor.tar.zst"
}


package() {
  install -dm755 "$pkgdir/usr/share/icons/"
  cp -a --no-preserve=ownership -t "$pkgdir/usr/share/icons/" "$srcdir/$__themename-hyprcursor"
  cp -a --no-preserve=ownership -t "$pkgdir/usr/share/icons/" "$srcdir/$__themename" # xcursor
  # xcursor dir = themename bc that's how it gets theme names for use in e.g. gsettings
}
