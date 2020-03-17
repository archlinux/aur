# Maintainer: termuellinator

pkgname=ryzencontroller-bin
_pkgver=2.1.0
pkgver=${_pkgver//[+-]/_}
pkgrel=1
pkgdesc="A minimal Electron application to use ryzenAdj through a friendly interface"
arch=('x86_64')
depends=('gtk3' 'ryzenadj-git')
provides=('ryzencontroller')
conflicts=('ryzencontroller')
url="https://gitlab.com/ryzen-controller-team/ryzen-controller"
license=('CC0 1.0 Universal')
source=("ryzencontroller_${_pkgver}_amd64.deb::https://gitlab.com/ryzen-controller-team/ryzen-controller/-/jobs/475206892/artifacts/raw/dist/deb/ryzen-controller_${_pkgver}_amd64.deb")
sha256sums=('6b3cd7eeea18f57dc902e300d55d63248db796430610125085db49d558070b18')

package() {
    cd "${srcdir}"

    bsdtar xf data.tar.xz
    chmod -R g-w usr
    chmod -R g-w opt
    mv usr "${pkgdir}"
    mv opt "${pkgdir}"
}
 
