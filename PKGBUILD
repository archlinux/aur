# Maintainer: termuellinator

pkgname=ryzencontroller-bin
_pkgver=2.2.1
pkgver=${_pkgver//[+-]/_}
pkgrel=1
pkgdesc="A minimal Electron application to use ryzenAdj through a friendly interface"
arch=('x86_64')
depends=('gtk3' 'ryzenadj-git')
provides=('ryzencontroller')
conflicts=('ryzencontroller')
url="https://gitlab.com/ryzen-controller-team/ryzen-controller"
license=('CC0 1.0 Universal')
source=("ryzencontroller_${_pkgver}_amd64.deb::https://gitlab.com/ryzen-controller-team/ryzen-controller/-/jobs/699081268/artifacts/raw/dist/deb/ryzen-controller_2.2.1_amd64.deb")
sha256sums=('f761aafd3d5e1278354c0781d55fbed2acc055c59959e041d9d187b864187e59')

package() {
    cd "${srcdir}"

    bsdtar xf data.tar.xz
    chmod -R g-w usr
    chmod -R g-w opt
    mv usr "${pkgdir}"
    mv opt "${pkgdir}"
}
