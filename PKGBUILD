# Maintainer : Thanos Apostolou <thanosapostolou@outlook.com>

# Build notes:
# https://phoenicisorg.github.io/phoenicis/Users/build/

pkgname=phoenicis-playonlinux
_pkgname=phoenicis
pkgver=5.0_alpha4
_pkgver=5.0-alpha4
pkgrel=2
pkgdesc="Phoenicis PlayOnLinux allows you to install and use non-native applications on linux"
arch=('any')
url="https://www.phoenicis.org/"
license=('LGPL3')
makedepends=('maven' 'java-environment-openjdk=11' 'git')
depends=('cabextract' 'curl' 'icoutils' 'imagemagick'
         'p7zip' 'unzip' 'wget' 'wine' 'xterm')
options=(!strip)
source=("https://github.com/ahmedmoselhi/${_pkgname}/releases/download/v${_pkgver}/Phoenicis_5.0-SNAPSHOT.deb")
sha256sums=('68622f98604d4902be9b15797e744b8c33872257a1cd4264d1a99d91d4d501da')

prepare() {
    bsdtar -xf data.tar.xz
}

package() {
  cp -a usr "${pkgdir}"
}