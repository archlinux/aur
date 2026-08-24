# Maintainer: maintuner <zackmelan>
_deb_base_name=outline
pkgname=outline-client-appimage-git
pkgver=1.21.0
pkgrel=1
pkgdesc="The Outline clients use the popular Shadowsocks protocol, and lean on the Cordova and Electron frameworks."
arch=(x86_64)
conflicts=('outline-client-appimage' 'outline-client-appimage-wayland' 'outline-client-appimage-git')
provides=('outline-client')
license=("Apache License 2.0")
url="https://getoutline.org"


#Outline-Client.AppImage::https://s3.amazonaws.com/outline-releases/client/linux/1.8.0/3/Outline-Client.AppImage"

makedepends=('binutils' 'wget')

source=("${_deb_base_name}.deb::https://s3.amazonaws.com/outline-releases/client/linux/stable/outline-client_amd64.deb")

md5sums=('55e408bc260decb0f0d1821bd4781356')

options=('!strip')

package() {
    ar x "${_deb_base_name}.deb"
    tar -xf data.tar.xz -C "${pkgdir}"
}
