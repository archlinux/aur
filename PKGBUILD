# Maintainer: termuellinator

pkgname=ryzen-controller-bin
_pkgver=2.5.0
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
source=("ryzen-controller_${_pkgver}_amd64.deb::$url/-/jobs/1545587016/artifacts/raw/dist/deb/ryzen-controller_2.5.0_amd64.deb")
sha256sums=('d44e7629629bab38d8bd3a00f61e569166c80dae1d7555315350bcf11fe1a0f4')

package() {
    bsdtar -xvf data.tar.xz -C "$pkgdir"
    chmod -R g-w "$pkgdir"/{usr,opt}
}
