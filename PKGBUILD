# Maintainer: Francisco Lopes <francisco@oblita.com>
pkgname=xps-home-end-keymappings-git
pkgver=1.0.0
pkgrel=3
pkgdesc="xps-home-end-keymappings: make xps's amazing keymapping works in other keyboard"
arch=('x86_64')
license=('GPL3')
url="https://github.com/soraxas/xps-home-end-keymappings"
depends=('libevdev')
makedepends=('gcc')
source=()
md5sums=()

build() {
    # gcc xps-home-end-keymappings.c -o xps-home-end-keymappings -I/usr/include/libevdev-1.0 -levdev -ludev
    make
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -m 755 xps-keymapping "${pkgdir}/usr/bin"

    mkdir -p "${pkgdir}/usr/lib/systemd/system"
    install -m 644 "${srcdir}/xps-keymapping.service" "${pkgdir}/usr/lib/systemd/system"
}
