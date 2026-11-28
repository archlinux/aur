# Maintainer: Dheeraj Vittal Shenoy <dheerajshenoy22@gmail.com>
pkgname=lektra-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="High-performance Document and Image viewer that prioritizes screen space and control"
arch=('x86_64')
url="https://codeberg.org/lektra/lektra"
license=('AGPL-3.0-only')
depends=(
    'qt6-base'
    'qt6-svg'
    'qt6-imageformats'
    'libarchive'
)
optdepends=(
    'djvulibre: DjVu documents'
    'librsvg: more accurate rendering of SVG images'
    'libexif: EXIF metadata in the properties of images'
    'binutils: symbolized stack traces in crash reports'
    'xdg-utils: open links in the web browser'
    'qt6-wayland: native Wayland support'
    'kvantum: Kvantum theme engine'
    'lua-language-server: completion for init.lua, using the installed Lua stubs'
)
provides=("lektra=${pkgver}")
conflicts=('lektra' 'lektra-git')
options=('!strip' '!debug')
source=(
    "lektra-${pkgver}-${CARCH}.tar.gz::https://codeberg.org/lektra/lektra/releases/download/v${pkgver}/lektra-${pkgver}-${CARCH}.tar.gz"
)

sha256sums=('f1d8543c6f79535fdc9380357f14f278590b645c504643c88fa20580165e5c5d')

package() {
    # The tarball is a ready-made /usr tree: binary, desktop file, man page,
    # tutorial, Lua stubs, translations, config schema and hicolor icons.
    cp -a "${srcdir}/usr" "${pkgdir}/"
}
