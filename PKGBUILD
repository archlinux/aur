# Contributor: cdfk <cdfk1981-at-gmail.com>

pkgname=brother-cups-wrapper-common
pkgver=1.0.0
pkgrel=1
pkgdesc="This package provides common files for some of the Brother cups wrapper packages."
license=('GPL' 'custom:brother commercial license')
url="http://solutions.brother.com/linux/en_us/index.html"
arch=('i686' 'x86_64')
depends=('brother-lpr-drivers-common' 'cups')
[ $CARCH == "x86_64" ] && _a="amd64" && md5sums=(
  'c656345afbb951780958069e2aed9db2')
[ $CARCH == "i686" ] && _a="i386" && md5sums=(
  '90c39c2270f9b3d231f5f930e208e73e')
source=(http://mirrors.kernel.org/ubuntu/pool/multiverse/b/${pkgname}/${pkgname}_${pkgver}-10-0ubuntu5_${_a}.deb)

build() {
 cd $srcdir || return 1
 ar -x ${pkgname}_${pkgver}-10-0ubuntu5_${_a}.deb || return 1
}

package() {
 cd $pkgdir || return 1
 tar -xzf ${srcdir}/data.tar.gz || return 1
}
