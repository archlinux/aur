# Maintainer: Omni LLC <team@omni.dev>
pkgname=omnidotdev-terminal-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="GPU-accelerated terminal emulator built to run everywhere (pre-built)"
arch=('x86_64')
url="https://terminal.omni.dev"
license=('MIT')
depends=('fontconfig' 'freetype2' 'libxkbcommon' 'wayland')
makedepends=('ncurses')
provides=('omnidotdev-terminal')
conflicts=('omnidotdev-terminal')
source=("https://github.com/omnidotdev/terminal/releases/download/v$pkgver/omni-terminal-x86_64-unknown-linux-gnu.tar.gz"
        "omni-terminal.desktop::https://raw.githubusercontent.com/omnidotdev/terminal/v$pkgver/misc/omni-terminal.desktop"
        "omni-terminal.svg::https://raw.githubusercontent.com/omnidotdev/terminal/v$pkgver/misc/logo.svg"
        "dev.omni.Terminal.metainfo.xml::https://raw.githubusercontent.com/omnidotdev/terminal/v$pkgver/misc/dev.omni.Terminal.metainfo.xml"
        "LICENSE::https://raw.githubusercontent.com/omnidotdev/terminal/v$pkgver/LICENSE.md"
        "NOTICE::https://raw.githubusercontent.com/omnidotdev/terminal/v$pkgver/NOTICE.md"
        "omni-terminal.terminfo::https://raw.githubusercontent.com/omnidotdev/terminal/v$pkgver/misc/omni-terminal.terminfo")

package() {
  install -Dm755 "omni-terminal" "$pkgdir/usr/bin/omni-terminal"
  install -Dm644 "omni-terminal.desktop" "$pkgdir/usr/share/applications/omni-terminal.desktop"
  install -Dm644 "omni-terminal.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/omni-terminal.svg"
  install -Dm644 "dev.omni.Terminal.metainfo.xml" "$pkgdir/usr/share/metainfo/dev.omni.Terminal.metainfo.xml"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  tic -sx -o "$pkgdir/usr/share/terminfo" "omni-terminal.terminfo"
  install -Dm644 "NOTICE" "$pkgdir/usr/share/doc/$pkgname/NOTICE"
}
sha256sums=('7c011bb1f19dc302c871568eabae8087696b9b1eb329877cb10beafed249d97e'
            'b9887bfd7879525cefd1df7eaf19eb0caab3429e886a4f9ee3752103335fd82e'
            'f1e389bb95778e9e8fdba238f5b57a9385a32049de00b867b44805693825e9fc'
            '0e2aa06d215a73ec5c073b39ddab21a33a187cc7a9df3c92e11a03ef3fa1aa84'
            'f6d51cfddf65fd0c0c60882e14d5d3a6621e58634e6ef4d59a1a48bc23f243fd'
            'b8bddc6fe92d9fea081898999839d77b3b64f190f6e025b9528ce5800f6678af'
            '92ab864206e507d9a6993b018f797666dc093de489554a6d55a12c49588fdc43')
