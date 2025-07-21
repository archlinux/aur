# Maintainer: smowtenshi <smowtenshi at protonmail dot com>
# Contributor: Asim Bera <asimbera at outlook dot in>


pkgname=lunacy-bin
_pkgname=lunacy
pkgver=11.6
pkgrel=1
pkgdesc="Free design software that keeps your flow with AI tools and built-in graphics"
arch=('x86_64')
url="https://icons8.com/lunacy"
license=('custom: commercial')
depends=('gcc-libs' 'hicolor-icon-theme' 'zlib' 'fontconfig')
provides=('lunacy')

options=(!debug)

source=(lunacy-mimetype.xml)
source_x86_64=(lunacy_x86_64_${pkgver}.deb::https://lcdn.icons8.com/setup/Lunacy_${pkgver}.deb)

sha256sums=('0c6ff2c10a75e19f3051c22b6002a78033a7508ad4bb5d234e85cdad22b0f4d0')
sha256sums_x86_64=('543776a813630b27cecb7bd915a55cdc123cce1426cc4231603370b3b0c86027')

package() {
  #echo "  -> Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/icons8/${_pkgname}/Lunacy "${pkgdir}"/usr/bin/lunacy

  install -m644 lunacy-mimetype.xml  "${pkgdir}/usr/share/mime/packages/${_pkgname}.xml"
}
