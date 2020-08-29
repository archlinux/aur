# Maintainer: termuellinator

pkgname=ryzen-controller-bin
_pkgver=2.2.4
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
source=("ryzen-controller_${_pkgver}_amd64.deb::https://gitlab.com/ryzen-controller-team/ryzen-controller/-/jobs/705055655/artifacts/raw/dist/deb/ryzen-controller_2.2.4_amd64.deb")
sha256sums=('549abf1bb78ef8d93fff3922696f69cc5ddca1ece88b0d985f39ef6e236230ef')

package() {
    bsdtar -xvf data.tar.xz -C "$pkgdir"
    chmod -R g-w "$pkgdir"/{usr,opt}
}
