# Maintainer: Nate Simon <njsimon10@gmail.com>

# Can change this to arm64 to make this package for arm
_arch=amd64

pkgname=kenku-fm-bin
pkgver=1.5.5
pkgrel=1
pkgdesc="Online tabletop audio sharing for Discord"
arch=('x86_64')
license=('GPL3')
depends=('libnotify' 'gtk3' 'nss' 'xdg-utils' 'libdrm' 'libxcb' 'gvfs')
makedepends=()
optdepends=()
provides=('kenku-fm')
conflicts=('kenku-fm')
url="https://github.com/owlbear-rodeo/kenku-fm"

source=("${url}/releases/download/v${pkgver}/kenku-fm_${pkgver}_${_arch}.deb")
md5sums=('e8776c46f40384e71aec00d6b5403390')


prepare() {
    cd "${srcdir}"
    tar -xvf data.tar.zst
}

package(){
    cd "${srcdir}"
    cp -a usr "${pkgdir}"
}
