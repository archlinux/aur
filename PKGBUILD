# Maintainer : ahmedmoselhi <ahmedmoselhi55@gmail.com>

# Build notes:
# https://phoenicisorg.github.io/phoenicis/Users/build/

pkgname=phoenicis-playonlinux
_pkgname=phoenicis
pkgver=5.0_alpha5
_pkgver=5.0-alpha5
pkgrel=1
pkgdesc="Phoenicis PlayOnLinux allows you to install and use non-native applications on linux"
arch=('any')
url="https://www.phoenicis.org/"
license=('LGPL3')
makedepends=('maven' 'java-environment-openjdk=11' 'git')
depends=('cabextract' 'curl' 'icoutils' 'imagemagick'
         'p7zip' 'unzip' 'wget' 'wine' 'xterm')
options=(!strip)
source=("https://github.com/ahmedmoselhi/${_pkgname}/releases/download/v${_pkgver}/Phoenicis_5.0-SNAPSHOT.deb")
sha256sums=('03f2c0cb6d4b277ddb5cac6044483c08fc879682132ce57f1ac69fc83ac5d049')

prepare() {
    bsdtar -xf data.tar.zst
}

package() {
  cp -a usr "${pkgdir}"
}