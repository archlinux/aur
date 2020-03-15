# Maintainer: termuellinator
pkgname=ryzencontroller-bin
_pkgver=2.0.0
pkgver=${_pkgver//[+-]/_}
pkgrel=1
pkgdesc="A minimal Electron application to use ryzenAdj through a friendly interface"
arch=('x86_64')
depends=('gtk3' 'ryzenadj-git')
provides=('ryzencontroller')
conflicts=('ryzencontroller')
url="https://gitlab.com/ryzen-controller-team/ryzen-controller"
license=('CC0 1.0 Universal')
source=("ryzencontroller_${_pkgver}_amd64.deb::https://gitlab.com/ryzen-controller-team/ryzen-controller/-/jobs/471899904/artifacts/raw/dist/deb/ryzen-controller_${_pkgver}_amd64.deb")
sha256sums=('7a34c10177c659e0656570a1a0c9e44e134637ff6eec41f2c71f9eb53364cd27')

package() {
    cd "${srcdir}"

    bsdtar xf data.tar.xz
    chmod -R g-w usr
    chmod -R g-w opt
    mv usr "${pkgdir}"
    mv opt "${pkgdir}"
}
 
