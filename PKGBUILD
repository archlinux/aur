# Maintainer: termuellinator

pkgname=ryzen-controller-bin
_pkgver=2.5.1
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
source=("ryzen-controller_${_pkgver}_amd64.deb::$url/-/jobs/1563440730/artifacts/raw/dist/deb/ryzen-controller_2.5.1_amd64.deb")
sha256sums=('a82dc017062a064b3a49dc182023719a25d87b42f1a3410b48ca527dad930fbe')

package() {
    bsdtar -xvf data.tar.xz -C "$pkgdir"
    chmod -R g-w "$pkgdir"/{usr,opt}
}
