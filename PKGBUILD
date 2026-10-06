# Maintainer: Frostal (upstream project)
# Crystal Sol's closed-source launcher; licensed game downloads remain per-user.
pkgname=crystal-sol-bin
pkgver=0.1.10
pkgrel=1
pkgdesc='Crystal Sol launcher and licensed game installer (official binary)'
arch=('x86_64')
url='https://frostal.us/crystal-sol'
license=('LicenseRef-Proprietary')
depends=('glibc' 'libgcc' 'xdg-utils' 'hicolor-icon-theme')
optdepends=(
  'libx11: X11 display support for the downloaded game'
  'libxkbcommon: keyboard support for the downloaded game'
  'wayland: Wayland display support for the downloaded game'
  'vulkan-icd-loader: Vulkan graphics support for the downloaded game'
  'vulkan-driver: Vulkan driver for the downloaded game'
  'libgl: OpenGL graphics support for the downloaded game'
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
  '2a7f13e658e69bbb612b6e9f90ba250464ead97bba9a37453a9d1eaec937f7c9'
  '53a4a2997878b660d1d458e5aa596ca775965e1e636eb4395db82b5eed9bfab9'
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
