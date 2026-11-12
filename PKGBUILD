# Maintainer: vii <coderdayton14 at gmail dot com>

pkgname=nightcap-bin
pkgver=0.5.2
pkgrel=1
pkgdesc='Android x86-64 Roblox compatibility runtime for Linux (prebuilt)'
arch=('x86_64')
url='https://github.com/CoderDayton/nightcap'
license=('Apache-2.0')
depends=(
  'capstone'
  'curl'
  'ffmpeg'
  'fontconfig'
  'gcc-libs'
  'glib2'
  'glibc'
  'gtk4'
  'hicolor-icon-theme'
  'libadwaita'
  'libelf'
  'libglvnd'
  'libplacebo'
  'libpng'
  'libsecret'
  'libsoup3'
  'libutf8proc'
  'libyaml'
  'minizip'
  'openssl'
  'sdl3>=3.4'
  'sdl3_ttf'
  'vulkan-icd-loader'
  'webkitgtk-6.0'
  'zlib'
)
optdepends=('gamemode: Feral GameMode integration')
provides=('mocktail' 'nightcap')
conflicts=('mocktail' 'nightcap' 'nightcap-git')
options=('!debug' '!strip')
# The release asset carries the pacman package release built by release.yml.
_archive="nightcap-${pkgver}-1-${CARCH}.pkg.tar.zst"
source=("${_archive}::https://github.com/CoderDayton/nightcap/releases/download/v${pkgver}/${_archive}")
noextract=("${_archive}")
# Replace with the checksum published beside the release asset.
sha256sums=('7769b954a166204a0b1884a8fdb59eb3e5092bf17c705459058af2ebbed9607f')

package() {
  bsdtar -xf "${srcdir}/${_archive}" -C "${pkgdir}" usr
  install -Dm644 "${pkgdir}/usr/share/licenses/nightcap/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
