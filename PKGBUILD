# Maintainer: Gokberk Yaltirakli <aur at gkbrk dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=harvey
pkgver=1.0.2
pkgrel=1
pkgdesc='WCAG color contrast compliance checker'
arch=('x86_64')
url='https://github.com/danrabbit/harvey'
license=('GPL2')
depends=('granite' 'libhandy')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('c8f31ec6f1bb672a15a6687aaa4902c3610a7415bff5631574d8338ddee51932')

build () {
    cd "${pkgname}-${pkgver}"
    meson build --prefix=/usr
    ninja -C build
}

package () {
    cd "${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" ninja -C build install
    cp "${pkgdir}/usr/bin/com.github.danrabbit.harvey" "${pkgdir}/usr/bin/${pkgname}"
}
