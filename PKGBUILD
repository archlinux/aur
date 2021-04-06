# Maintainer: termuellinator

pkgname=ryzen-controller-bin
_pkgver=2.4.0
pkgver=${_pkgver//[+-]/_}
pkgrel=1
pkgdesc="A minimal Electron application to use ryzenAdj through a friendly interface"
arch=('x86_64')
depends=('gtk3' 'ryzenadj-git')
provides=('ryzen-controller')
conflicts=('ryzen-controller' 'ryzencontroller')
replaces=('ryzencontroller-bin' 'ryzencontroller')
url="https://gitlab.com/ryzen-controller-team/ryzen-controller"
license=('CC0 1.0 Universal')
source=("ryzen-controller_${_pkgver}_amd64.deb::https://gitlab.com/ryzen-controller-team/ryzen-controller/-/jobs/1151742724/artifacts/raw/dist/deb/ryzen-controller_2.4.0_amd64.deb")
sha256sums=('f0ddb7221a5cd33c43b55f60786dde177c85897f2a8be021a570315f1edd05a1')

package() {
    bsdtar -xvf data.tar.xz -C "$pkgdir"
    chmod -R g-w "$pkgdir"/{usr,opt}
}
