# Maintainer: taotieren <admin@taotieren.com>

pkgname=linyaps-store-minimalist-bin
_pkgname=OpenList.Desktop
pkgver=1.0.9
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
sha256sums=('16d4a59be73ddff33864de30adc8847e15ad625bf8adb92b9dfcd2b71de11d81')
noextract=("linux-${pkgver}-x86_64.deb")

package() {
    cd "$srcdir"/
    mkdir -pv linux-${pkgver}-x86_64
    bsdtar -xf linux-${pkgver}-x86_64.deb -C linux-${pkgver}-x86_64
    cd linux-${pkgver}-x86_64
    bsdtar -xf data.tar.xz --numeric-owner -C ${pkgdir}/
    chown -R root:root ${pkgdir}
}
