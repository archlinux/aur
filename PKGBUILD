# Contributor: cdfk <cdfk1981-at-gmail.com>

pkgname=brother-lpr-drivers-laser
pkgver=2.0.1
pkgrel=1
pkgdesc="Provides all LPR drivers for models DCP-7010 DCP-7020 DCP-7025 DCP-8060 DCP-8065DN FAX-2820 FAX-2920 HL-2030 HL-2040 HL-2070N HL-5240 HL-5250DN HL-5270DN HL-5280DW MFC-7220 MFC-7225N MFC-7420 MFC-7820N MFC-8460N MFC-8660DN MFC-8860DN MFC-8870DW"
license=('GPL' 'custom:brother commercial license')
url="http://solutions.brother.com/linux/en_us/index.html"
arch=('i686' 'x86_64')
[ $CARCH == "x86_64" ] && _a="amd64" && md5sums=(
  '39ad6a5c7966a2ba9a9f7f2de32f4c7e') && depends=('brother-lpr-drivers-common' 'a2ps' 'lib32-glibc')
[ $CARCH == "i686" ] && _a="i386" && md5sums=(
  'ae119016dadf28962a0dacd31cf15cad') && depends=('brother-lpr-drivers-common' 'a2ps')
source=(http://mirrors.kernel.org/ubuntu/pool/multiverse/b/${pkgname}/${pkgname}_${pkgver}-3-0ubuntu3_${_a}.deb)

build() {
 cd $srcdir || return 1
 ar -x ${pkgname}_${pkgver}-3-0ubuntu3_${_a}.deb || return 1
}

package() {
 cd $pkgdir || return 1
 tar -xzf ${srcdir}/data.tar.gz || return 1
}
