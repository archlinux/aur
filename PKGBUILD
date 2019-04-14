# Maintainer: Jayvee Enaguas <harvettfox96@airmail.cc>

pkgname=ttf-genericmobile
pkgver=20190323.02
pkgrel=1
pkgdesc="A raster proportional sans serif typeface, extracted from various generic/knockoff mobile devices."
url="https://notabug.org/HarvettFox96/${pkgname}"
license=("CC0-1.0")
arch=("any")
depends=("fontconfig" "xorg-font-utils" "xorg-fonts-encodings")
source=("GenericMobileSystem-${pkgver}.zip::https://notabug.org/attachments/94a98506-f3cd-40b3-b867-e679f75c5256"
        "GenericMobileSystem-${pkgver}.zip.sig::https://notabug.org/attachments/84602d65-ad97-42bf-9a6e-c6be57656b4b")
sha512sums=("13b5060eee736b0c2b5324a58b8637a476feb64ba478b9d3b53710c4454f50a1630d83a97ea5317ba9b0ee046d10e911b7915e8514f3d38f14a9f922b947e32c"
            "SKIP")
validpgpkeys=("30E2144356008681839AE9C192F8F52D258B63E6"
              "4C565E3C3DB4DE43785F0DA9B627DC6AB09D9B83")

prepare() {
  sed -e 's/\r//g' LICENSE.txt > LICENSE;
}

package() {
  install -dm755 "${pkgdir}/usr/share/fonts/TTF/";
  install -Dm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/";
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE";
  rm -frv "${srcdir}/"*;
}
