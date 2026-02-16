# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=kdotool-bin
pkgver=0.2.2
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
sha256sums=('527306b8e8269844d38147c1608eec512100bf8bbcb66a32aa6d083b03e7a729')

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    bsdtar -x -f "${pkgname}-${pkgver}.tar.gz" -C "${pkgname}-${pkgver}"
}

package() {
    install -D -m755 "${pkgname}-${pkgver}/kdotool" -t "${pkgdir}/usr/bin"
}
