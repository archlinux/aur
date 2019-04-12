# Maintainer: Jayvee Enaguas <harvettfox96@airmail.cc>

pkgname=ttf-aireexterior
pkgver=20190407.02
pkgrel=1
pkgdesc="A geometric sans serif typeface based on the title screen of the 1959 film Plan 9 from Outer Space, superseded from Aero Matics."
url="https://notabug.org/HarvettFox96/${pkgname}"
license=("CC0-1.0")
arch=("any")
depends=("fontconfig" "xorg-font-utils" "xorg-fonts-encodings")
source=("AireExterior-${pkgver}.zip::https://notabug.org/attachments/dfcac8d9-3641-499c-b760-aa3d7ad2373b"
        "AireExterior-${pkgver}.zip.sig::https://notabug.org/attachments/268b4da3-4036-4ca2-be39-d90bb0702e8c")
sha512sums=("dfac5487d87f9d53036879aee972379dd850a96b834de616dc77fb75b3b9fc53e100708b9aeccbdbbf164ced0322470481697c4d1cce5c3283812b942602d881"
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
