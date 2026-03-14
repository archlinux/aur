# Maintainer: mazix

pkgname=codex-desktop-native
pkgver=0.1.9
pkgrel=1
pkgdesc='Prebuilt native Linux package for OpenAI Codex Desktop with bundled Electron'
arch=('x86_64')
url='https://github.com/mazixs/codex-desktop'
license=('Apache-2.0')
depends=(
  'brotli'
  'c-ares'
  'flac'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glibc'
  'gtk3'
  'harfbuzz'
  'libdrm'
  'libevent'
  'libffi'
  'libjpeg-turbo'
  'libpng'
  'libpulse'
  'libxml2'
  'libxslt'
  'minizip'
  'nss'
  'opus'
  'zlib'
)
optdepends=(
  'pipewire: WebRTC desktop sharing under Wayland'
  'xdg-utils: open external links with the desktop default handler'
)
provides=('codex-desktop' 'codex-desktop-bin')
conflicts=('codex-desktop' 'codex-desktop-bin')
replaces=('codex-desktop' 'codex-desktop-bin')
options=('!strip' '!debug')

_pkg_archive="${pkgname}-${pkgver}-archlinux-x86_64.pkg.tar.zst"
source=("${_pkg_archive}::${url}/releases/download/v${pkgver}/${_pkg_archive}")
sha256sums=('d329bdb7daf479c1f1d42c39138ab84688c1c54d8b62bee78cf2c78515da8996')
noextract=("${_pkg_archive}")

package() {
  bsdtar -xf "${srcdir}/${_pkg_archive}" -C "${pkgdir}" \
    --exclude='.BUILDINFO' \
    --exclude='.MTREE' \
    --exclude='.PKGINFO' \
    --exclude='.INSTALL' \
    --exclude='.CHANGELOG'
}
