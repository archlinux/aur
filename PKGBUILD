# Maintainer: Jayvee Enaguas <harvettfox96@protonmail.com>

pkgname=ttf-genericmobile
pkgver=20190103.01
pkgrel=1
pkgdesc="A raster proportional sans serif typeface, extracted from various generic mobile devices." 
url="https://notabug.org/HarvettFox96/${pkgname}"
license=("CC0")
arch=("any")
depends=("fontconfig" "xorg-font-utils" "xorg-fonts-encodings")
source=("https://notabug.org/HarvettFox96/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgver}.tar.gz.sig::https://notabug.org/attachments/026153a0-c06a-4a60-a296-1f217dd95529")
sha512sums=("a9c4027af295a89d2c6b2801ef7d1760bca4d477f8b2956559a6c2877fd175274b50f45b58af26b3598bb7d6a6b2d881cbab0eb5245c59d7a02f48cd0576b85e"
            "SKIP")
validpgpkeys=("4C565E3C3DB4DE43785F0DA9B627DC6AB09D9B83"
              "925C741082DC0DB32CF8AADFCB73A6EB26948E91")

prepare() {
  tar -zxvf ${pkgver}.tar.gz;
  mv -v ${pkgname}/{LICENSE,ttf/*.ttf} "${srcdir}/";
}

package() {
  install -dm755 "${pkgdir}/usr/share/fonts/TTF/";
  install -Dm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/";
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE";
  rm -frv "${srcdir}/"*;
}
