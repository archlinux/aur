# Maintainer: termuellinator

pkgname=ryzen-controller-bin
_pkgver=2.4.1
pkgver=${_pkgver//[+-]/_}
pkgrel=2
pkgdesc="A minimal Electron application to use ryzenAdj through a friendly interface"
arch=('x86_64')
depends=('gtk3' 'ryzenadj-git')
provides=('ryzen-controller')
conflicts=('ryzen-controller' 'ryzencontroller')
replaces=('ryzencontroller-bin' 'ryzencontroller')
url="https://gitlab.com/ryzen-controller-team/ryzen-controller"
license=('CC0 1.0 Universal')
source=("ryzen-controller_${_pkgver}_amd64.deb::$url/-/jobs/1220935756/artifacts/raw/dist/deb/ryzen-controller_2.4.1_amd64.deb")
sha256sums=('49e8b1027eb0642dcc585f9ec669aabc4e339fc9bb04d61fcaeffe0162a552a3')

package() {
    bsdtar -xvf data.tar.xz -C "$pkgdir"
    chmod -R g-w "$pkgdir"/{usr,opt}
}
