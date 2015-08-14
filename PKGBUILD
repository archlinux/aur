# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: cdfk <cdfk1981-at-gmail.com>

pkgname=brother-cups-wrapper-laser
pkgver=2.0.1_2_0ubuntu6
pkgrel=1
pkgdesc='Provides all cups wrapper drivers for models DCP-7010 DCP-7020 DCP-7025 DCP-8060 DCP-8065DN FAX-2820 FAX-2920 HL-2030 HL-2040 HL-2070N HL-5240 HL-5250DN HL-5270DN HL-5280DW MFC-7220 MFC-7225N MFC-7420 MFC-7820N MFC-8460N MFC-8660DN MFC-8860DN MFC-8870DW'
license=('GPL' 'custom:brother commercial license')
url='http://solutions.brother.com/linux/en_us/index.html'
arch=('i686' 'x86_64')
depends=('brother-lpr-drivers-laser' 'brother-cups-wrapper-common')
[ $CARCH == 'x86_64' ] && _a='amd64' && sha256sums=(
  '33886d794d9b700ef13badb07829cde80c097e7968ce53848246850832263b9e')
[ $CARCH == 'i686' ] && _a='i386' && sha256sums=(
  'ec31d40dc2a5c896cf9ce7eb6b46c927f136b22c129f0b4bf50ce77dbe3570f6')
source=("http://mirrors.kernel.org/ubuntu/pool/multiverse/b/${pkgname}/${pkgname}_${pkgver//_/-}_${_a}.deb")

build() {
 ar -x "${pkgname}_${pkgver//_/-}_${_a}.deb"
}

package() {
 cd $pkgdir
 tar -xzf ${srcdir}/data.tar.gz
}
