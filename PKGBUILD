# Maintainer: smowtenshi <smowtenshi at protonmail dot com>
# Contributor: Asim Bera <asimbera at outlook dot in>


pkgname=lunacy-bin
_pkgname=lunacy
pkgver=10.6
pkgrel=1
pkgdesc="Free design software that keeps your flow with AI tools and built-in graphics"
arch=('x86_64')
url="https://icons8.com/lunacy"
license=('custom: commercial')
depends=('gcc-libs' 'hicolor-icon-theme' 'zlib' 'fontconfig')
provides=('lunacy')

source=(lunacy-mimetype.xml)
source_x86_64=(lunacy_x86_64_${pkgver}.deb::https://lcdn.icons8.com/setup/Lunacy_${pkgver}.deb)

sha256sums=('0c6ff2c10a75e19f3051c22b6002a78033a7508ad4bb5d234e85cdad22b0f4d0')
sha256sums_x86_64=('0e6285cb423c8a25cc96af9722a2b2c477460ada67714a669946f0a6e1d83014')

package() {
  #echo "  -> Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/icons8/${_pkgname}/Lunacy "${pkgdir}"/usr/bin/lunacy

  install -m644 lunacy-mimetype.xml  "${pkgdir}/usr/share/mime/packages/${_pkgname}.xml"
}
