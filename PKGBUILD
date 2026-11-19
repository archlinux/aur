# Maintainer: lumexren <lumexren@gmail.com>

pkgname=ungoogled-vulcanium-bin
pkgver=157.0.8103.78
pkgrel=1
pkgdesc="ungoogled-chromium with native Wayland Vulkan rendering and Vulkan Video decoding/encoding (prebuilt)"
arch=('x86_64')
url="https://github.com/lumexren/vulcanium"
license=('BSD-3-Clause')
provides=('chromium' 'ungoogled-chromium' 'ungoogled-vulcanium')
conflicts=('chromium' 'ungoogled-chromium' 'ungoogled-vulcanium')
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
backup=('etc/chromium/default-flags.conf')
options=('!strip')
source=("https://github.com/lumexren/vulcanium/releases/download/v${pkgver}-${pkgrel}/ungoogled-vulcanium-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("ungoogled-vulcanium-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('2bec31149458ff9fa7a3aca5b1189ab3af5f5189ee1a356535d63e574c2ad40a')

package() {
  bsdtar -xf "${srcdir}/ungoogled-vulcanium-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" \
    -C "${pkgdir}" \
    --exclude='.BUILDINFO' \
    --exclude='.MTREE' \
    --exclude='.PKGINFO' \
    --exclude='.INSTALL'
}
