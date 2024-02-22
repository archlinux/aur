# Maintainer: irmluity <45vw4yz8g@mozmail.com>

pkgname=warp-terminal
pkgver=0.2024.02.20.08.01.stable_01
pkgrel=1
pkgdesc="Warp, the Rust-based terminal for developers and teams"
arch=(x86_64)
url='https://warp.dev'
license=('custom')
depends=('curl' 'fontconfig' 'libegl' 'libx11' 'libxcb' 'libxcursor' 'libxi' 'libxkbcommon-x11' 'xdg-utils' 'zlib')
optdepends=(
    'zenity: for file dialogs in Gnome'
    'kdialog: for file dialogs in KDE'
    'org.freedesktop.secrets: for securely storing passwords'
)
source=("${pkgname}-${pkgver}-$CARCH.pkg.tar.zst::https://releases.warp.dev/stable/v${pkgver}/warp-terminal-v${pkgver}-${pkgrel}-$CARCH.pkg.tar.zst")
sha256sums=('2fc6a59ea484e1caeb0e8cd17cf68000c90b73ee7ef1df5704a77975db31983d')

package() {
    cd $srcdir
    rm -f .BUILDINFO .MTREE .PKGINFO ${pkgname}-${pkgver}-$CARCH.pkg.tar.zst
    cp -a "$srcdir/"* "$pkgdir/"
}
