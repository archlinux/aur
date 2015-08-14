# Contributor: cdfk <cdfk1981-at-gmail.com>

pkgname=brother-cups-wrapper-laser
pkgver=2.0.1
pkgrel=1
pkgdesc="Provides all cups wrapper drivers for models DCP-7010 DCP-7020 DCP-7025 DCP-8060 DCP-8065DN FAX-2820 FAX-2920 HL-2030 HL-2040 HL-2070N HL-5240 HL-5250DN HL-5270DN HL-5280DW MFC-7220 MFC-7225N MFC-7420 MFC-7820N MFC-8460N MFC-8660DN MFC-8860DN MFC-8870DW"
license=('GPL' 'custom:brother commercial license')
url="http://solutions.brother.com/linux/en_us/index.html"
arch=('i686' 'x86_64')
depends=('brother-lpr-drivers-laser' 'brother-cups-wrapper-common')
[ $CARCH == "x86_64" ] && _a="amd64" && md5sums=(
  '74af4e012f39378a77844563a98f2598')
[ $CARCH == "i686" ] && _a="i386" && md5sums=(
  '54a42c1643705f21dfe787ccc4f50536')
source=(http://mirrors.kernel.org/ubuntu/pool/multiverse/b/${pkgname}/${pkgname}_${pkgver}-2-0ubuntu5_${_a}.deb)

build() {
 cd $srcdir || return 1
 ar -x ${pkgname}_${pkgver}-2-0ubuntu5_${_a}.deb || return 1
}

package() {
 cd $pkgdir || return 1
 tar -xzf ${srcdir}/data.tar.gz || return 1
}
