# Maintainer: Boris Yumankulov <boriabloger[at]protonmail[dot]com>

pkgname=portprotonqt
pkgver=0.1.11
pkgrel=1
pkgdesc="Modern GUI for managing and launching games from PortProton, Steam, and Epic Games Store"
arch=('any')
url="https://git.linux-gaming.ru/Boria138/PortProtonQt"
license=('GPL-3.0')
depends=('python-requests' 'python-babel' 'python-evdev' 'python-pyudev' 'python-orjson'
    'python-psutil' 'python-tqdm' 'python-vdf' 'python-libarchive-c' 'pyside6' 'python-rapidfuzz' 'icoextract' 'python-pillow' 'perl-image-exiftool' 'python-beautifulsoup4' 'python-websocket-client' 'cabextract' 'unzip' 'curl' 'unrar' 'qt6-svg' 'pciutils' 'mesa-utils' 'vulkan-icd-loader')
depends_aarch64=('muvm')
makedepends=('meson' 'ninja' 'vulkan-headers')
source=("git+https://git.linux-gaming.ru/Boria138/PortProtonQt#tag=v$pkgver")
sha256sums=('66cb620f94e223b101ad79b3cdeee018afd0c963c4b0cddb1983de9cf0b1be45')

build() {
    arch-meson PortProtonQt build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
