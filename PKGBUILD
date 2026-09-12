# Maintainer: komaruworld <rtysus228 at gmail dot com>

pkgname=mocktail-bin
pkgver=1.0.4
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
# Release asset names do not include the AUR package release.
_archive="mocktail-${pkgver}-${CARCH}.pkg.tar.zst"
source=("${_archive}::https://github.com/komaruworld/mocktail/releases/download/${pkgver}/${_archive}")
noextract=("${_archive}")
sha256sums=('d5cc7216e88fd2889369e8eb7fba4276b2746c2b084dce566aaaa7505bc2ffb7')

package() {
  bsdtar -xf "${srcdir}/${_archive}" -C "${pkgdir}" usr
  install -Dm644 "${pkgdir}/usr/share/licenses/mocktail/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
