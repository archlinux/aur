# Maintainer: Jayvee Enaguas <harvettfox96@protonmail.com>

pkgname=ttf-genericmobile
pkgver=20190103.03
pkgrel=1
pkgdesc="A raster proportional sans serif typeface, extracted from various generic/knockoff mobile devices."
url="https://notabug.org/HarvettFox96/${pkgname}"
license=("CC0-1.0")
arch=("any")
depends=("fontconfig" "xorg-font-utils" "xorg-fonts-encodings")
source=("https://notabug.org/HarvettFox96/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgver}.tar.gz.sig::https://notabug.org/attachments/286e90da-f1af-4cab-9e71-5fe44340f81f")
sha512sums=("9350b348200baeb5d202ee4f2135fb6a32f3231deb9bd7d4a45f3938a65274263ed002c9089444b2add688ae8d69ff7cb2e5e947ae25a46a5e4185e9274e6b4a"
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
