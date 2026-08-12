# Maintainer: komaruworld <rtysus228 at gmail dot com>

pkgname=mocktail-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Android x86-64 Roblox compatibility runtime for Linux (prebuilt)'
arch=('x86_64')
url='https://github.com/komaruworld/mocktail'
license=('Apache-2.0')
depends=(
  'capstone'
  'curl'
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
provides=('mocktail')
conflicts=('mocktail' 'mocktail-git')
options=('!debug' '!strip')
_archive="mocktail-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.zst"
source=("${_archive}::https://github.com/komaruworld/mocktail/releases/download/${pkgver}/${_archive}")
noextract=("${_archive}")
sha256sums=('f8a44ca7bd35526035ce7d1902ff7a4b1981a7c36e54d82ce4fc655db6fdf0f3')

package() {
  bsdtar -xf "${srcdir}/${_archive}" -C "${pkgdir}" usr
  install -Dm644 "${pkgdir}/usr/share/licenses/mocktail/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
