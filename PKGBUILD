# Maintainer: termuellinator
pkgname=ryzencontroller
_pkgver=1.15.0
pkgver=${_pkgver//[+-]/_}
pkgrel=3
pkgdesc="A minimal Electron application to use ryzenAdj through a friendly interface"
arch=('x86_64')
depends=('gtk3')
provides=('ryzencontroller')
conflicts=('ryzencontroller')
url="https://gitlab.com/ryzen-controller-team/ryzen-controller"
license=('CC0 1.0 Universal')
source=("ryzencontroller_${_pkgver}_amd64.deb::https://gitlab.com/ryzen-controller-team/ryzen-controller/-/jobs/274540190/artifacts/file/installer-builds/installers/ryzencontroller_${_pkgver}_amd64.deb")
sha256sums=('20141bbdfb96290e4317cc8148194c2d5cdc4c5bb0a872b85e713dacf5b911e4')

package() {
    cd "${srcdir}"

    bsdtar xf data.tar.xz
    chmod -R g-w usr
    mv usr "${pkgdir}"
}
 
