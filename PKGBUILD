# Maintainer: vii <coderdayton14 at gmail dot com>

pkgname=nightcap-bin
pkgver=0.5.0
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
sha256sums=('48353f5a65a6887ac3ed9b48cd251bb9486188757d496761d710bb3e2b6acf2e')

package() {
  bsdtar -xf "${srcdir}/${_archive}" -C "${pkgdir}" usr
  install -Dm644 "${pkgdir}/usr/share/licenses/nightcap/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
