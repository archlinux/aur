# Maintainer: Nate Simon <njsimon10@gmail.com>

# Can change this to arm64 to make this package for arm
_arch=amd64

pkgname=kenku-fm-bin
pkgver=1.3.2
pkgrel=1
pkgdesc="Online tabletop audio sharing for Discord"
arch=('x86_64')
license=('GPL3')
depends=('libnotify' 'gtk3' 'nss' 'xdg-utils' 'libdrm' 'libxcb' 'gvfs' 'openssl-1.1')
makedepends=()
optdepends=()
provides=('kenku-fm')
conflicts=('kenku-fm')
url="https://github.com/owlbear-rodeo/kenku-fm"

source=("${url}/releases/download/v${pkgver}/kenku-fm_${pkgver}_${_arch}.deb")
md5sums=('7f0b802f505afda1f17c83c0dc093da2')


prepare() {
    cd "${srcdir}"
    tar -xvf data.tar.xz
}

package(){
    cd "${srcdir}"
    cp -a usr "${pkgdir}"
}
