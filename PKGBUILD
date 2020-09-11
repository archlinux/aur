# Maintainer: termuellinator

pkgname=ryzen-controller-bin
_pkgver=2.2.5
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
source=("ryzen-controller_${_pkgver}_amd64.deb::https://gitlab.com/ryzen-controller-team/ryzen-controller/-/jobs/722987880/artifacts/raw/dist/deb/ryzen-controller_2.2.5_amd64.deb")
sha256sums=('96153c3fdf6adfeefe7b010f846c75391711f9544654474143581c8ab2349bf7')

package() {
    bsdtar -xvf data.tar.xz -C "$pkgdir"
    chmod -R g-w "$pkgdir"/{usr,opt}
}
