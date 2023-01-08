# Maintainer: gbr <gbr@protonmail.com>
pkgname=maxautoclicker
pkgver=1.5.8
pkgrel=3
pkgdesc='Emulate and automate your mouse clicks'
arch=('x86_64')
url='https://maxautoclicker.blogspot.com/'
license=('custom')
depends=('gtk2' 'libxtst')
source=("https://github.com/mautosoft/$pkgname/releases/download/v$pkgver/$pkgname-${pkgver}_amd64.deb")
sha256sums=('1293a91680c94d5791ce6eb2f2d86d9a2ee942788978d0a689e64dcaa471cf67')

prepare() {
  mkdir $pkgname-$pkgver
  tar -xf data.tar.xz -C $pkgname-$pkgver
  sed -i '/^Icon=/c Icon=maxautoclicker' "$pkgname-$pkgver/usr/share/applications/$pkgname.desktop"
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 -t "$pkgdir/usr/bin" "usr/bin/$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/applications" "usr/share/applications/$pkgname.desktop"
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/16x16/apps"   "usr/share/icons/hicolor/16x16/apps/$pkgname.png"
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/24x24/apps"   "usr/share/icons/hicolor/24x24/apps/$pkgname.png"
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/32x32/apps"   "usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/48x48/apps"   "usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/64x64/apps"   "usr/share/icons/hicolor/64x64/apps/$pkgname.png"
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/72x72/apps"   "usr/share/icons/hicolor/72x72/apps/$pkgname.png"
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/96x96/apps"   "usr/share/icons/hicolor/96x96/apps/$pkgname.png"
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/128x128/apps" "usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/256x256/apps" "usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/512x512/apps" "usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm644 "usr/share/doc/$pkgname/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
