# Maintainer: Jayvee Enaguas <harvettfox96@protonmail.com>

pkgname=ttf-moderndos
pkgver=20181216.01
pkgrel=1
pkgdesc="A raster monospace serif typeface based on IBM and Verite, extracted from VGA ROM typefaces in real machines by various manufacturers."
url="https://notabug.org/HarvettFox96/${pkgname}"
license=("CC0")
arch=("any")
depends=("fontconfig" "xorg-font-utils" "xorg-fonts-encodings")
source=("https://notabug.org/HarvettFox96/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgver}.tar.gz.sig::https://notabug.org/attachments/73f7cec5-e916-4a35-8e65-4f7b4e7344c7")
sha512sums=("b85cad3e487db3db21f25d55fda302ab1233bb4653e6db0117d59d81b1f542a1398f1957af19c86d664a829ed8b171c7f07a0eacf5bc003395638dfe956890f5"
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
