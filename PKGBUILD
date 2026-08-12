# Maintainer: Rijuyuezhu <rijuyuezhu@users.noreply.github.com>
pkgname=fcitx-vinpst-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Prebuilt Rust voice-input addon for Fcitx 5 with native ASR and PipeWire capture'
arch=('x86_64')
url='https://github.com/rijuyuezhu/fcitx-vinpst'
license=('GPL-3.0-or-later' 'Apache-2.0' 'MIT')
depends=(
  'coreutils'
  'fcitx5'
  'fontconfig'
  'glib2'
  'glibc'
  'libgcc'
  'libpipewire'
  'libstdc++'
  'libx11'
  'libxkbcommon'
  'systemd'
  'systemd-libs'
  'util-linux'
  'wayland'
)
optdepends=('wireplumber: output-volume ducking through wpctl')
provides=('fcitx-vinpst')
conflicts=('fcitx-vinpst')
options=('!strip' '!debug')
install=fcitx-vinpst.install

_release_pkg="fcitx-vinpst-${pkgver}-1-x86_64.pkg.tar.zst"
source_x86_64=("${_release_pkg}::${url}/releases/download/v${pkgver}/${_release_pkg}")
sha256sums_x86_64=('b88326542ac31096f47b1b6f7d8e5511a085342fbd3951122f87d6454838afd0')
noextract=("${_release_pkg}")

package() {
  bsdtar -xpf "${srcdir}/${_release_pkg}" -C "${pkgdir}" usr
}
