# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=kdotool-bin
pkgver=0.2.3
pkgrel=1
pkgdesc='A xdotool clone for KDE Wayland (pre-compiled binary)'
arch=('x86_64')
url='https://github.com/jinliu/kdotool/'
license=('Apache-2.0')
depends=(
    'dbus'
    'glibc'
    'libgcc')
provides=('kdotool')
conflicts=('kdotool')
options=('!debug' '!strip')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/jinliu/kdotool/releases/download/v${pkgver}/kdotool-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('a30c09175d1c4180afa394e8ccbf61c8780d79845a2ed89c9f39f7804a5b1433')

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    bsdtar -x -f "${pkgname}-${pkgver}.tar.gz" -C "${pkgname}-${pkgver}"
}

package() {
    install -D -m755 "${pkgname}-${pkgver}/kdotool" -t "${pkgdir}/usr/bin"
}
