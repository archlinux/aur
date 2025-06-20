# Maintainer: maintuner <zackmelan>
_deb_base_name=outline
pkgname=outline-client-appimage-git
pkgver=1.15.1
pkgrel=2
pkgdesc="The Outline clients use the popular Shadowsocks protocol, and lean on the Cordova and Electron frameworks."
arch=(x86_64)
conflicts=('outline-client-appimage' 'outline-client-appimage-wayland' 'outline-client-appimage-git')
license=("Apache License 2.0")
url="https://getoutline.org"


#Outline-Client.AppImage::https://s3.amazonaws.com/outline-releases/client/linux/1.8.0/3/Outline-Client.AppImage"

makedepends=('binutils' 'wget')

source=("${_deb_base_name}.deb::https://s3.amazonaws.com/outline-releases/client/linux/stable/outline-client_amd64.deb")

md5sums=('ec2b301510cb5508003e77fb94d3a179')

options=('!strip')

package() {
    ar x "${_deb_base_name}.deb"
    tar -xf data.tar.xz -C "${pkgdir}"
}
