# Maintainer: taotieren <admin@taotieren.com>

pkgname=linyaps-store-minimalist-bin
_pkgname=OpenList.Desktop
pkgver=1.1.6
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
source=("${url}/releases/download/${pkgver}/linux-${pkgver}-x86_64.deb")
sha256sums=('e367c4be9872f3c5b2854d545cc87a08acee4ba2eca6402ff1d3646207ed362e')
noextract=("linux-${pkgver}-x86_64.deb")

package() {
    cd "$srcdir"/
    mkdir -pv linux-${pkgver}-x86_64
    bsdtar -xf linux-${pkgver}-x86_64.deb -C linux-${pkgver}-x86_64
    cd linux-${pkgver}-x86_64
    bsdtar -xf data.tar.xz --numeric-owner -C ${pkgdir}/
    chown -R root:root ${pkgdir}
}
