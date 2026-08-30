# Maintainer: Omni <team@omni.dev>
pkgname=omnidotdev-terminal-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="GPU-accelerated terminal emulator built to run everywhere (pre-built)"
arch=('x86_64')
url="https://terminal.omni.dev"
license=('Apache-2.0')
depends=('fontconfig' 'freetype2' 'libxkbcommon' 'wayland')
makedepends=('ncurses')
provides=('omnidotdev-terminal')
conflicts=('omnidotdev-terminal')
source=("$pkgname-$pkgver.tar.gz::https://github.com/omnidotdev/terminal/releases/download/v$pkgver/omni-terminal-x86_64-unknown-linux-gnu.tar.gz"
        "$pkgname-$pkgver.desktop::https://raw.githubusercontent.com/omnidotdev/terminal/v$pkgver/misc/omni-terminal.desktop"
        "$pkgname-$pkgver.svg::https://raw.githubusercontent.com/omnidotdev/terminal/v$pkgver/misc/logo.svg"
        "$pkgname-$pkgver.metainfo.xml::https://raw.githubusercontent.com/omnidotdev/terminal/v$pkgver/misc/dev.omni.Terminal.metainfo.xml"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/omnidotdev/terminal/v$pkgver/LICENSE.md"
        "$pkgname-$pkgver-NOTICE::https://raw.githubusercontent.com/omnidotdev/terminal/v$pkgver/NOTICE.md"
        "$pkgname-$pkgver.terminfo::https://raw.githubusercontent.com/omnidotdev/terminal/v$pkgver/misc/omni-terminal.terminfo")

package() {
  install -Dm755 "omni-terminal" "$pkgdir/usr/bin/omni-terminal"
  install -Dm644 "$pkgname-$pkgver.desktop" "$pkgdir/usr/share/applications/omni-terminal.desktop"
  install -Dm644 "$pkgname-$pkgver.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/omni-terminal.svg"
  install -Dm644 "$pkgname-$pkgver.metainfo.xml" "$pkgdir/usr/share/metainfo/dev.omni.Terminal.metainfo.xml"
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  tic -sx -o "$pkgdir/usr/share/terminfo" "$pkgname-$pkgver.terminfo"
  install -Dm644 "$pkgname-$pkgver-NOTICE" "$pkgdir/usr/share/doc/$pkgname/NOTICE"
}
sha256sums=('ab81131e417e063710d7c9dd4bea9acabd484ed978d567ba080b683d3826bc9a'
            'b9887bfd7879525cefd1df7eaf19eb0caab3429e886a4f9ee3752103335fd82e'
            'f1e389bb95778e9e8fdba238f5b57a9385a32049de00b867b44805693825e9fc'
            '0e2aa06d215a73ec5c073b39ddab21a33a187cc7a9df3c92e11a03ef3fa1aa84'
            '64d90764a9baac9d5f0797d6d9a7dfb26823396df09c872557e971cf76cc0a92'
            'b8bddc6fe92d9fea081898999839d77b3b64f190f6e025b9528ce5800f6678af'
            '92ab864206e507d9a6993b018f797666dc093de489554a6d55a12c49588fdc43')
