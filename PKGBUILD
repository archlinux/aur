# Maintainer: termuellinator

pkgname=ryzencontroller-bin
_pkgver=2.2.2
pkgver=${_pkgver//[+-]/_}
pkgrel=1
pkgdesc="A minimal Electron application to use ryzenAdj through a friendly interface"
arch=('x86_64')
depends=('gtk3' 'ryzenadj-git')
provides=('ryzencontroller')
conflicts=('ryzencontroller')
url="https://gitlab.com/ryzen-controller-team/ryzen-controller"
license=('CC0 1.0 Universal')
source=("ryzencontroller_${_pkgver}_amd64.deb::https://gitlab.com/ryzen-controller-team/ryzen-controller/-/jobs/703686194/artifacts/raw/dist/deb/ryzen-controller_2.2.2_amd64.deb")
sha256sums=('ca96924db9267fece13cf3de2d9010cdf85b48a3e0bcde0f94a8bd48573631b8')

package() {
    cd "${srcdir}"

    bsdtar xf data.tar.xz
    chmod -R g-w usr
    chmod -R g-w opt
    mv usr "${pkgdir}"
    mv opt "${pkgdir}"
}
