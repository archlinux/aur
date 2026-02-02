# Maintainer: Azur84 <Azur84@outlook.fr>
pkgname=pandora-launcher-bin
pkgver=2.7.3
pkgrel=1
pkgdesc="A modern Minecraft launcher that balances ease-of-use with powerful instance management features."
arch=('x86_64')
provides=("pandora-launcher")
conflicts=("pandora-launcher")
url="http://pandora.moulberry.com/"
license=('MIT')
options=(!strip)
depends=(
  'libxkbcommon-x11'
  'vulkan-tools'
  'wayland'
  'libxkbcommon'
  'libxcb'
  'vulkan-icd-loader'
  'vulkan-driver'
  'openssl'
)
optdepends=(
  'flite: minecraft narrator support'
  'orca: minecraft screen reader'
  'gamemode: gamemode support'
  'mangohud: mangohud support'
)
source=(
  "pandora-launcher-$pkgver-$pkgrel::https://github.com/Moulberry/PandoraLauncher/releases/download/v$pkgver/PandoraLauncher-Linux-$pkgver-x86_64-Portable"
  "LICENSE::https://raw.githubusercontent.com/Moulberry/PandoraLauncher/refs/tags/v$pkgver/LICENSE"
  "icon.svg::https://raw.githubusercontent.com/Moulberry/PandoraLauncher/refs/tags/v$pkgver/package/windows.svg"
  "$pkgname.desktop"
)
sha256sums=('e933c1cd808ed249d9bf79f1e4cbdfb09932441a921c717061d727341ce60e04'
            'a416ff7bf8fca263a47d8256c154c4405df3502506520613500bed0cb6eb86a8'
            '8c045dbd40e52ee10f439e90f368ef4a12c0f3f830f252b2fefd2e862bc76fc5'
            '8ae5fa2476e937d0fdc1e53bacb62d8a5ac333d98f17da987d13b25e1a1afe31')

package() {
  install -d "$pkgdir/usr/"{bin,share/{pixmaps,applications}}

  install -Dm755 pandora-launcher-$pkgver-$pkgrel "$pkgdir/usr/bin/${pkgname::-4}"
  install -Dm644 "icon.svg" "$pkgdir/usr/share/pixmaps/${pkgname::-4}.svg"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname::-4}/LICENSE"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/${pkgname::-4}.desktop"
}
