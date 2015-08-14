# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: cdfk <cdfk1981-at-gmail.com>

pkgname=brother-lpr-drivers-laser
pkgver=2.0.1_3_0ubuntu5
pkgrel=1
pkgdesc='Provides all LPR drivers for models DCP-7010 DCP-7020 DCP-7025 DCP-8060 DCP-8065DN FAX-2820 FAX-2920 HL-2030 HL-2040 HL-2070N HL-5240 HL-5250DN HL-5270DN HL-5280DW MFC-7220 MFC-7225N MFC-7420 MFC-7820N MFC-8460N MFC-8660DN MFC-8860DN MFC-8870DW'
license=('GPL' 'custom:brother commercial license')
url='http://solutions.brother.com/linux/en_us/index.html'
arch=('i686' 'x86_64')
[ $CARCH == 'x86_64' ] && _a='amd64' && sha256sums=(
  'bd35371d79dd9ea02e8563be7b429f43acf9fc8d7bf01a187d8413eb16cfa221') && depends=('brother-lpr-drivers-common' 'a2ps' 'lib32-glibc')
[ $CARCH == 'i686' ] && _a='i386' && sha256sums=(
  'fba405edd53dedffed9beb604d9f301f0b241630badaa9f340387866563d2713') && depends=('brother-lpr-drivers-common' 'a2ps')
source=("http://mirrors.kernel.org/ubuntu/pool/multiverse/b/${pkgname}/${pkgname}_${pkgver//_/-}_${_a}.deb")

build() {
 ar -x "${pkgname}_${pkgver//_/-}_${_a}.deb"
}

package() {
 cd $pkgdir
 tar -xzf ${srcdir}/data.tar.gz
}
