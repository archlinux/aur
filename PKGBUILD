# Maintainer: termuellinator
pkgname=ryzencontroller-bin
_pkgver=1.15.1
pkgver=${_pkgver//[+-]/_}
pkgrel=1
pkgdesc="A minimal Electron application to use ryzenAdj through a friendly interface"
arch=('x86_64')
depends=('gtk3' 'ryzenadj-git')
provides=('ryzencontroller')
conflicts=('ryzencontroller')
url="https://gitlab.com/ryzen-controller-team/ryzen-controller"
license=('CC0 1.0 Universal')
source=("ryzencontroller_${_pkgver}_amd64.deb::https://gitlab.com/ryzen-controller-team/ryzen-controller/-/jobs/279507798/artifacts/raw/installer-builds/installers/ryzencontroller_${_pkgver}_amd64.deb")
sha256sums=('1cb59ca8ee247676f5cff3378223098a902c2628549daaf8b2f6289d2dcf0475')

package() {
    cd "${srcdir}"

    bsdtar xf data.tar.xz
    chmod -R g-w usr
    mv usr "${pkgdir}"
}
 
