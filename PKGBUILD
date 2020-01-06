# Maintainer: termuellinator
pkgname=ryzencontroller-bin
_pkgver=1.17.0
pkgver=${_pkgver//[+-]/_}
pkgrel=1
pkgdesc="A minimal Electron application to use ryzenAdj through a friendly interface"
arch=('x86_64')
depends=('gtk3' 'ryzenadj-git')
provides=('ryzencontroller')
conflicts=('ryzencontroller')
url="https://gitlab.com/ryzen-controller-team/ryzen-controller"
license=('CC0 1.0 Universal')
source=("ryzencontroller_${_pkgver}_amd64.deb::https://gitlab.com/ryzen-controller-team/ryzen-controller/-/jobs/394031834/artifacts/raw/installer-builds/installers/ryzencontroller_${_pkgver}_amd64.deb")
sha256sums=('9ba2c7b8962596b3f6c919d19eb1004e09d2e8e9c0def8232f477fafa2409b88')

package() {
    cd "${srcdir}"

    bsdtar xf data.tar.xz
    chmod -R g-w usr
    mv usr "${pkgdir}"
}
 
