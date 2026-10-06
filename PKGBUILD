# Maintainer: Frostal (upstream project)
# Crystal Sol's closed-source launcher; licensed game downloads remain per-user.
pkgname=crystal-sol-bin
pkgver=0.1.11
pkgrel=1
pkgdesc='Crystal Sol launcher and licensed game installer (official binary)'
arch=('x86_64')
url='https://frostal.us/crystal-sol'
license=('LicenseRef-Proprietary')
depends=('glibc' 'libgcc' 'xdg-utils' 'hicolor-icon-theme' 'libx11' 'libxcb' 'libxkbcommon' 'wayland')
optdepends=(
  'libgl: OpenGL graphics support for the downloaded game'
  'vulkan-icd-loader: Vulkan graphics support for the downloaded game'
  'vulkan-driver: Vulkan driver for the downloaded game'
  'alsa-lib: sound support for the downloaded game'
)
provides=('crystal-sol')
conflicts=('crystal-sol')
options=('!strip' '!debug')
source=(
  "https://downloads.frostal.us/crystal-sol/launcher/${pkgver}/crystal-sol-launcher-${pkgver}-${CARCH}-linux.tar.gz"
  'crystal-sol.desktop'
  'crystal-sol.png'
  'LICENSE-NOTICE'
)
sha256sums=(
  '66b47ee9423af668a2fcc9ef9406ad9acc3855c6edf1e748001367f8047a7a2e'
  '67a53badefb32111995c56a2e2fcfd640fdad27d248ee6300d7299df74d8e193'
  '2f9dd476b59343e516e477bbd731d3a78b0d22362379251fc5a971521a0ad4f3'
  'fa418322cd602a3be1078640a784b8f55ffa5fcedfeb817143593bcc922882b0'
)

package() {
  install -Dm755 crystal-sol-launcher "$pkgdir/usr/bin/crystal-sol-launcher"
  ln -s crystal-sol-launcher "$pkgdir/usr/bin/crystal-sol"
  install -Dm644 crystal-sol.desktop "$pkgdir/usr/share/applications/crystal-sol.desktop"
  install -Dm644 crystal-sol.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/crystal-sol.png"
  install -Dm644 LICENSE-NOTICE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-NOTICE"
}
