# Maintainer: Gokberk Yaltirakli <aur at gkbrk dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='hourglass'
pkgver=3.1.0
pkgrel=1
pkgdesc='Simple clock application that provides stopwatches, alarms, and timers'
arch=('x86_64')
url='https://github.com/sgpthomas/hourglass'
license=('GPL3')
depends=('gtk4' 'libgee' 'granite7' 'libportal-gtk4')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('b58104bc983a329ca0036d7df974828f7fd4659ac425e33d02de8c46a2c571d9')

build () {
    cd "${pkgname}-${pkgver}"
    meson build --prefix=/usr
    cd build
    ninja
}

package () {
    cd "${pkgname}-${pkgver}"
    cd build
    DESTDIR="${pkgdir}" ninja install
    cp "${pkgdir}/usr/bin/com.github.sgpthomas.hourglass" "${pkgdir}/usr/bin/hourglass"
}
