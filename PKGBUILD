# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

_pkgname=Amethyst-Mod-Manager
pkgname=amethyst-mod-manager
pkgver=0.7.8
pkgrel=1
pkgdesc='A Linux native mod manager for a variety of games'
arch=('any')
url='https://github.com/ChrisDKN/Amethyst-Mod-Manager'
license=('GPL-3.0-only')
depends=(
    'python-customtkinter'
    'python-py7zr'
    'python-libarchive-c'
    'python-pillow'
    'python-lz4'
    'python-zstandard'
    'python-requests'
    'python-websocket-client'
    'python-keyring'
    'python-importlib-metadata'
    'python-msgpack'
    'python-gobject'
    'zenity'
#     'libloot'
#     'python-libloot'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ChrisDKN/Amethyst-Mod-Manager/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1d188b7bad2b08c9a15aca5535e09aef484cdafb57b964e809c4ffe65ee03326')

package() {
    cd "${_pkgname}-${pkgver}/src"

    install -d "$pkgdir/usr/share/${pkgname}"

    find . -path "./appimage" -prune -o \
        -not -name "requirements*.txt" \
        -not -name "rebuild_libloot.sh" \
        -not -name "loot.cpython*.so" \
        -not -name "run.sh" \
        -type f \
        -exec install -Dm 755 '{}' "$pkgdir/usr/share/${pkgname}/{}" \;
}
