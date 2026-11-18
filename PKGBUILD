# Maintainer: lumexren <lumexren@gmail.com>

pkgname=vulcanium-bin
pkgver=157.0.8103.78
pkgrel=1
pkgdesc="Chromium with native Wayland Vulkan rendering and Vulkan Video decoding/encoding (prebuilt)"
arch=('x86_64')
url="https://github.com/lumexren/vulcanium"
license=('BSD-3-Clause')
provides=('vulcanium' 'chromium')
conflicts=('vulcanium')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'desktop-file-utils'
  'expat'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libffi'
  'libgcc'
  'libgcrypt'
  'libpulse'
  'libstdc++'
  'libva'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'pciutils'
  'systemd'
  'systemd-libs'
  'ttf-liberation'
  'vulkan-icd-loader'
  'xdg-utils'
  'zlib'
)
optdepends=(
  'pipewire: WebRTC desktop sharing under Wayland'
  'kdialog: support for native dialogs in Plasma'
  'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
  'qt6-base: Qt support'
  'org.freedesktop.secrets: password storage backend on GNOME, KDE and Xfce'
  'upower: Battery Status API support'
)
backup=('etc/vulcanium/default-flags.conf')
options=('!strip')
source=("https://github.com/lumexren/vulcanium/releases/download/v${pkgver}-${pkgrel}/vulcanium-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("vulcanium-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('e7431c340d35bc336912166f9503a1d18c9f41d5bb95b7c74cab9effd6629193')

package() {
  bsdtar -xf "${srcdir}/vulcanium-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" \
    -C "${pkgdir}" \
    --exclude='.BUILDINFO' \
    --exclude='.MTREE' \
    --exclude='.PKGINFO' \
    --exclude='.INSTALL'
}
