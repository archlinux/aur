# Contributor: cdfk <cdfk1981-at-gmail.com>

pkgname=brother-lpr-drivers-common
pkgver=1.0.0
pkgrel=1
pkgdesc="This package provides common files for Brother LPR drivers packages."
license=('GPL' 'custom:brother commercial license')
url="http://solutions.brother.com/linux/en_us/index.html"
arch=('i686' 'x86_64')
[ $CARCH == "x86_64" ] && _a="amd64" && md5sums=(
  '6dc720f964d2be0a9e117289bec56a30')
[ $CARCH == "i686" ] && _a="i386" && md5sums=(
  '42bb28bcdd3ec22ff50fa63db87cefb6')
source=(http://mirrors.kernel.org/ubuntu/pool/multiverse/b/${pkgname}/${pkgname}_${pkgver}-4-0ubuntu1_${_a}.deb)

build() {
 cd $srcdir || return 1
 ar -x ${pkgname}_${pkgver}-4-0ubuntu1_${_a}.deb || return 1
}

package() {
 cd $pkgdir || return 1
 tar -xzf ${srcdir}/data.tar.gz || return 1
}
