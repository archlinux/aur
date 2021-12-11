# Contributor: cdfk <cdfk1981-at-gmail.com>

pkgname=brother-cups-wrapper-common
pkgver=1.0.0
pkgrel=3
pkgdesc="This package provides common files for some of the Brother cups wrapper packages."
license=('GPL' 'custom:brother commercial license')
url="http://solutions.brother.com/linux/en_us/index.html"
arch=('i686' 'x86_64')
depends=('brother-lpr-drivers-common' 'cups')
[ $CARCH == "x86_64" ] && _a="amd64" && md5sums=(
  'a0eba0401fe80b7a4c1de777032d24f1')
[ $CARCH == "i686" ] && _a="i386" && md5sums=(
  '0606a3bddcc387254eb0c0ffeadae72c')
source=(http://ubuntu-master.mirror.tudos.de/ubuntu/pool/multiverse/b/${pkgname}/${pkgname}_${pkgver}-10-0ubuntu7_${_a}.deb)

build() {
 cd $srcdir || return 1
 ar -x ${pkgname}_${pkgver}-10-0ubuntu7_${_a}.deb || return 1
}

package() {
 cd $pkgdir || return 1
 tar -xvf ${srcdir}/data.tar.xz || return 1
}
