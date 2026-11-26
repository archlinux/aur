# Maintainer: lumexren <lumexren@gmail.com>

pkgname=ungoogled-vulcanium-bin
pkgver=158.0.8127.36
pkgrel=4
pkgdesc="ungoogled-chromium with native Wayland Vulkan rendering and Vulkan Video decoding/encoding (prebuilt)"
arch=('x86_64')
url="https://github.com/lumexren/vulcanium"
license=('BSD-3-Clause')
provides=('vulcanium' 'chromium' 'ungoogled-chromium' 'ungoogled-vulcanium')
conflicts=('chromium' 'ungoogled-chromium' 'vulcanium' 'vulcanium-bin' 'ungoogled-vulcanium')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'brotli'
  'cairo'
  'dav1d'
  'dbus'
  'desktop-file-utils'
  'double-conversion'
  'expat'
  'flac'
  'fontconfig'
  'freetype2'
  'glib2'
  'glibc'
  'gtk3'
  'harfbuzz'
  'hicolor-icon-theme'
  'highway'
  'libcups'
  'libdrm'
  'libffi'
  'libgcc'
  'libgcrypt'
  'libjpeg-turbo'
  'libpulse'
  'libstdc++'
  'libva'
  'libwebp'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxml2'
  'libxrandr'
  'libxss'
  'mesa'
  'minizip'
  'nspr'
  'nss'
  'openh264'
  'opus'
  'pango'
  'pciutils'
  'simdutf'
  'systemd'
  'systemd-libs'
  'ttf-liberation'
  'vulkan-icd-loader'
  'xdg-utils'
  'zlib'
  'zstd'
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
sha256sums=('cd4a49a1163229035abc934a277f016cc474a81804e87b04b7a8f84ae3d7f1de')

package() {
  bsdtar -xf "${srcdir}/ungoogled-vulcanium-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" \
    -C "${pkgdir}" \
    --exclude='.BUILDINFO' \
    --exclude='.MTREE' \
    --exclude='.PKGINFO' \
    --exclude='.INSTALL'
}
