# Maintainer: lumexren <lumexren@gmail.com>

pkgname=ungoogled-vulcanium-bin
pkgver=158.0.8127.36
pkgrel=1
pkgdesc="ungoogled-chromium with native Wayland Vulkan rendering and Vulkan Video decoding/encoding (prebuilt)"
arch=('x86_64')
url="https://github.com/lumexren/vulcanium"
license=('BSD-3-Clause')
provides=('vulcanium' 'chromium' 'ungoogled-chromium' 'ungoogled-vulcanium')
conflicts=('chromium' 'ungoogled-chromium' 'vulcanium' 'vulcanium-bin' 'ungoogled-vulcanium')
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
source=("https://github.com/lumexren/vulcanium/releases/download/v${pkgver}-${pkgrel}/ungoogled-vulcanium-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("ungoogled-vulcanium-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('c2d98482c133afb6521cae5e04478a44d20bd4f6f4cf419a38d2d7f34cccedb2')

package() {
  bsdtar -xf "${srcdir}/ungoogled-vulcanium-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" \
    -C "${pkgdir}" \
    --exclude='.BUILDINFO' \
    --exclude='.MTREE' \
    --exclude='.PKGINFO' \
    --exclude='.INSTALL'
}
