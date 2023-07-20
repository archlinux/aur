# Maintainer: icefox <hd@revive-it.ru>

pkgbase=aspia-client
pkgname=(aspia-client)
pkgver=2.5.2
pkgrel=1
pkgdesc="Remote desktop and file transfer tool."
arch=('x86_64')
url="https://github.com/dchapyshev/aspia"
license=('GPL3')
options=('!strip')

source_x86_64=("${pkgbase}-${pkgver}-${arch}.deb::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-${arch}.deb")
sha256sums_x86_64=('5295342c21d099dd1f2ad09559875cb6f22b5367e85d16ec27d2d152775f9fad')

_install_path="/opt/aspia-client"
prepare() {
   yay -S archalien-git
  archalien ../src/"${pkgbase}-${pkgver}-${arch}.deb"
}

package_aspia-client() {
    provides=("${pkgname}")
    conflicts=("${pkgname}")
    depends=(
        'gtk3'
    )
    sudo pacman -U ../src/"${pkgbase}-${pkgver}-${arch}.tar.zst"

}
