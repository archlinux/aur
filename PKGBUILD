# Maintainer: Rijuyuezhu <rijuyuezhu@users.noreply.github.com>
pkgname=fcitx-vinpst-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='Prebuilt Rust voice-input addon for Fcitx 5 with native ASR and PipeWire capture'
arch=('x86_64')
url='https://github.com/rijuyuezhu/fcitx-vinpst'
license=('GPL-3.0-or-later' 'Apache-2.0' 'MIT')
depends=(
  'coreutils'
  'fcitx5'
  'fontconfig'
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
sha256sums_x86_64=('deb8433a18dbbb5b316c3db76120f9611040d0b4f8230ca09512ddcae904b893')
noextract=("${_release_pkg}")

package() {
  bsdtar -xpf "${srcdir}/${_release_pkg}" -C "${pkgdir}" usr
}
