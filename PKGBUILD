# Maintainer: taotieren <admin@taotieren.com>

pkgname=linyaps-store-minimalist-bin
_pkgname=OpenList.Desktop
pkgver=1.0.4
pkgrel=1
pkgdesc="Linyaps Store Minimalist"
arch=('x86_64')
url="https://github.com/LFRon/Linyaps-Store-Minimalist"
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
license=('GPL-2.0-only')
depends=(
    'at-spi2-core'
    'cairo'
    'gcc-libs'
    'gdk-pixbuf2'
    'glibc'
    'glib2'
    'gtk3'
    'harfbuzz'
    'hicolor-icon-theme'
    'fontconfig'
    'libepoxy'
    'pango'
    'zlib'
)
makedepends=('libarchive')
optdepends=("linyaps: Next-Gen Universal Package Manager for Linux (linglong)")
backup=()
options=('!strip' '!debug')
source=("${url}/releases/download/${pkgver}/${pkgver}-x86_64.deb")
sha256sums=('f5d61914b71e6772c8dd0d93ecfebe050d53d3f8f1c65227be2dc6455d9f11f5')
noextract=("${pkgver}-x86_64.deb")

package() {
    cd "$srcdir"/
    mkdir -pv ${pkgver}-x86_64
    bsdtar -xf ${pkgver}-x86_64.deb -C ${pkgver}-x86_64
    cd ${pkgver}-x86_64
    bsdtar -xf data.tar.xz --numeric-owner -C ${pkgdir}/
    chown -R root:root ${pkgdir}
}
