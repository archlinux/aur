# Maintainer: termuellinator
pkgname=ryzencontroller
_pkgver=1.15.0
pkgver=${_pkgver//[+-]/_}
pkgrel=1
pkgdesc="A minimal Electron application to use ryzenAdj through a friendly interface"
arch=('x86_64')
depends=('gtk3')
provides=('ryzencontroller')
conflicts=('ryzencontroller')
url="https://gitlab.com/ryzen-controller-team/ryzen-controller"
license=('CC0 1.0 Universal')
source=("ryzencontroller_${_pkgver}_amd64.deb::https://gitlab.com/ryzen-controller-team/ryzen-controller/-/jobs/274540190/artifacts/file/installer-builds/installers/ryzencontroller_${_pkgver}_amd64.deb")
sha256sums=('6a1818fa28dd39ff12746685ba5d530b65b332323d92070fe88da98d09c8001c')

package() {
    cd "${srcdir}"

    bsdtar xf data.tar.xz
    chmod -R g-w usr
    mv usr "${pkgdir}"
}
 
