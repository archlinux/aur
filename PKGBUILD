# Maintainer: termuellinator

pkgname=ryzen-controller-bin
_pkgver=2.6.0
pkgver=${_pkgver//[+-]/_}
pkgrel=2
pkgdesc="(DEPRECATED) A minimal Electron application to use ryzenAdj through a friendly interface"
arch=('x86_64')
depends=('gtk3' 'ryzenadj-git')
provides=('ryzen-controller')
conflicts=('ryzen-controller' 'ryzencontroller')
url="https://gitlab.com/ryzen-controller-team/ryzen-controller"
license=('CC0 1.0 Universal')
source=("ryzen-controller_${_pkgver}_amd64.deb::https://gitlab.com/ryzen-controller-team/ryzen-controller/-/jobs/3178939815/artifacts/raw/dist/deb/ryzen-controller_2.6.0_amd64.deb")
sha256sums=('ab611dca6894aef92ab8159890efa7f21b5ded3391444f994977efbdf2ff0a37')

package() {
    bsdtar -xvf data.tar.xz -C "$pkgdir"
    chmod -R g-w "$pkgdir"/{usr,opt}
}
