# Maintainer: Jay Jackson <aur.archlinux.org@jjay.dev>
pkgname=advantagescope-bin
_pkgname=advantagescope
pkgver=4.1.6
pkgrel=1
pkgdesc="Robot telemetry application for FRC"
arch=('x86_64')
url="https://docs.advantagescope.org/"
license=('MIT')
provides=($_pkgname)
source=("https://github.com/Mechanical-Advantage/AdvantageScope/releases/download/v${pkgver}/advantagescope-linux-x64-v${pkgver}.deb")
md5sums=('e43cb310d19ebda7c780ba9be1c46c99') #generate with 'makepkg -g'

prepare() {
    mkdir -p "${srcdir}/dist"
    tar -xJvf "${srcdir}/data.tar.xz" -C "${srcdir}/dist"
}

package() {
    cp -r "${srcdir}/dist"/* "${pkgdir}"
}
