# Maintainer: glatavento <glatavento at outlook dot com>

pkgname=isp55e0-git
_pkgname=isp55e0
pkgver=r34.6a7f58c
pkgrel=1
pkgdesc='An ISP flashing tool for the WCH CH55x, CH579, CH32F103 under linux.'
arch=(x86_64)
url='https://github.com/frank-zago/isp55e0'
license=('GPL3')
makedepends=('git' 'libusb')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 isp55e0 ${pkgdir}/usr/bin/${_pkgname}
}

