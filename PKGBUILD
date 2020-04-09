# Maintainer: termuellinator

pkgname=ryzencontroller-bin
_pkgver=2.2.0
pkgver=${_pkgver//[+-]/_}
pkgrel=3
pkgdesc="A minimal Electron application to use ryzenAdj through a friendly interface"
arch=('x86_64')
depends=('gtk3' 'ryzenadj-git')
provides=('ryzencontroller')
conflicts=('ryzencontroller')
url="https://gitlab.com/ryzen-controller-team/ryzen-controller"
license=('CC0 1.0 Universal')
source=("ryzencontroller_${_pkgver}_amd64.deb::https://gitlab.com/ryzen-controller-team/ryzen-controller/-/jobs/489573334/artifacts/raw/dist/deb/ryzen-controller_2.2.0_amd64.deb")
sha256sums=('ad77f50ef2ef504f9a47784af3b21b171b67a80786dca7c28074a4721c6f3314')

package() {
    cd "${srcdir}"

    bsdtar xf data.tar.xz
    chmod -R g-w usr
    chmod -R g-w opt
    mv usr "${pkgdir}"
    mv opt "${pkgdir}"
}
 
