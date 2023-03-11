# Maintainer: smowtenshi <smowtenshi at protonmail dot com>
# Contributor: Asim Bera <asimbera at outlook dot in>


pkgname=lunacy-bin
_pkgname=lunacy
pkgver=9.0.6
pkgrel=1
pkgdesc="Free design software that keeps your flow with AI tools and built-in graphics"
arch=('x86_64')
url="https://icons8.com/lunacy"
license=('custom: commercial')
depends=('gcc-libs' 'hicolor-icon-theme' 'zlib' 'fontconfig')
provides=('lunacy')

source_x86_64=(lunacy_x86_64_${pkgver}.deb::https://lun-eu.icons8.com/s/setup/Lunacy_${pkgver}.deb)
sha256sums_x86_64=('980c2d784239a7412b01b2a04909f895a9f7906714a01ec21a900fe15c5168b3')

package() {
  echo "  -> Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/icons8/${_pkgname}/Lunacy "${pkgdir}"/usr/bin/lunacy
}
