# Maintainer: Azur84 <Azur84@outlook.fr>
pkgname=pandora-launcher-bin
pkgver=2.5.0
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
  'hicolor-icon-theme'
)
optdepends=(
  'flite: minecraft narrator support'
)
source=(
  "pandora-launcher::https://github.com/Moulberry/PandoraLauncher/releases/download/v$pkgver/PandoraLauncher-Linux-$pkgver-x86_64"
  "LICENSE::https://raw.githubusercontent.com/Moulberry/PandoraLauncher/refs/tags/v$pkgver/LICENSE"
  "icon.png::https://raw.githubusercontent.com/Moulberry/PandoraLauncher/refs/tags/v$pkgver/package/icon_256x256.png"
  "$pkgname.desktop"
)
sha256sums=('cd7bb7f10082bdd05b432c833514c0b7f6e4f374cfa0f41446c7e53a7d8c3cfb'
            'a416ff7bf8fca263a47d8256c154c4405df3502506520613500bed0cb6eb86a8'
            'daed097826dae15dc84c5e5cfd8ad818c020b326bec961f84b7885f914e9df22'
            '8ae5fa2476e937d0fdc1e53bacb62d8a5ac333d98f17da987d13b25e1a1afe31')

package() {
  install -d "$pkgdir/usr/"{bin,share/{pixmaps,applications}}

  install -Dm755 pandora-launcher "$pkgdir/usr/bin/${pkgname::-4}"
  install -Dm644 "icon.png" "$pkgdir/usr/share/pixmaps/${pkgname::-4}.png"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname::-4}/LICENSE"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/${pkgname::-4}.desktop"
}
