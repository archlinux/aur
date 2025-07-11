# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=kdotool-bin
pkgver=0.2.1
pkgrel=4
pkgdesc='A xdotool clone for KDE Wayland (pre-compiled binary)'
arch=('x86_64')
url='https://github.com/jinliu/kdotool/'
license=('Apache-2.0')
depends=(
    'dbus'
    'gcc-libs'
    'glibc')
provides=('kdotool')
conflicts=('kdotool')
options=('!debug' '!strip')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/jinliu/kdotool/releases/download/v${pkgver}/kdotool-${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('c94101c2d1f8269d70829ed947c28c01053653817cb3358f0fd6962542c0461a')

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    bsdtar -x -f "${pkgname}-${pkgver}.tar.gz" -C "${pkgname}-${pkgver}"
}

package() {
    install -D -m755 "${pkgname}-${pkgver}/kdotool" -t "${pkgdir}/usr/bin"
}
