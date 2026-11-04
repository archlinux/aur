# Maintainer: Carmine Paolino <carmine@paolino.me>
#
# Generated for each Solco release by crmne/solco-releases
# (packaging/aur/solco-bin/PKGBUILD.erb). Changes belong there.
#
# Solco is proprietary: this installs the official Debian package's files
# unchanged. It needs a licence key from https://getsolco.com.

pkgname=solco-bin
_tag=v1.0.0-beta.9
pkgver=1.0.0beta.9
pkgrel=1
pkgdesc='Prep studio for DJs: grids, keys, tags, smart playlists and USB exports for CDJs (private beta, needs a licence key)'
arch=('x86_64' 'aarch64')
url='https://getsolco.com'
license=('LicenseRef-Solco')
depends=(
  'alsa-lib'
  'dbus'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libglvnd'
  'libpipewire'
  'libx11'
  'libxcursor'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'
  'openssl'
  'vulkan-icd-loader'
  'wayland'
)
optdepends=(
  'vulkan-driver: analyse on the graphics card'
  'xdg-desktop-portal: file and folder pickers'
  'zenity: file and folder pickers without a desktop portal'
  'polkit: password prompt for making a USB drive write quickly'
)
provides=('solco')
conflicts=('solco')
options=('!debug' '!strip')
source_x86_64=("solco-${_tag}-amd64.deb::https://github.com/crmne/solco-releases/releases/download/${_tag}/solco_1.0.0.beta.9_amd64.deb")
source_aarch64=("solco-${_tag}-arm64.deb::https://github.com/crmne/solco-releases/releases/download/${_tag}/solco_1.0.0.beta.9_arm64.deb")
sha256sums_x86_64=('23cfb6acf6579c6490613d5f602b3d23314e4ff16f317aa0bbf03c35845204c6')
sha256sums_aarch64=('4d3ab8f966a97a98a27b2cdb2033788268ffccbe217e5ce7c4c0e9dae404901e')

package() {
  bsdtar -xf data.tar.* -C "${pkgdir}"
  # Arch keeps a package's licence under its own name.
  mv "${pkgdir}/usr/share/licenses/solco" "${pkgdir}/usr/share/licenses/${pkgname}"
}
