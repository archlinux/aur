# Maintainer: taotieren <admin@taotieren.com>

pkgname=kingdeekiscloud-bin
_name=${pkgname/-bin}
pkgver=1.0.3
pkgrel=0
epoch=
pkgdesc="金蝶 KIS 云 for Linux"
arch=('x86_64')
url="https://kisdoc.kingdee.com/web/#/81/1282"
license=('LGLP' 'Commercial')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${_name}-${pkgver}.deb::http://downloads.cmcloud.cn/kis/kiscloud/stable/$_name-amd64.$pkgver.deb")
noextract=(${_name}-${pkgver}.deb)
sha256sums=('5abe9d9bf58376fc3210939acd76b7c7d6829412c5f01c724eda381f3dfcec4e')
#validpgpkeys=()

prepare() {
#    ar -x *.rpm
    mkdir -p ${_name}
    bsdtar -xf "${srcdir}/${_name}-${pkgver}.deb" --numeric-owner -C "${srcdir}/${_name}"
}

package() {
    export LC_CTYPE="zh_CN.UTF-8"
    bsdtar -xf "${srcdir}/${_name}/data.tar.xz" --numeric-owner -C "${pkgdir}"
    cd "${pkgdir}"
    find . -name ".DS_Store" -exec rm -r {} \;
}
