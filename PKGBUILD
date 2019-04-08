# Maintainer: Jayvee Enaguas <harvettfox96@airmail.cc>

pkgname=ttf-aireexterior
pkgver=20190407.01
pkgrel=2
pkgdesc="A geometric sans serif typeface based on the title screen of the 1959 film Plan 9 from Outer Space, superseded from Aero Matics."
url="https://notabug.org/HarvettFox96/${pkgname}"
license=("CC0-1.0")
arch=("any")
depends=("fontconfig" "xorg-font-utils" "xorg-fonts-encodings")
source=("AireExterior-${pkgver}.zip::https://notabug.org/attachments/9a1a77c5-fc8f-4ad4-9247-0dc957852cc6"
        "AireExterior-${pkgver}.zip.sig::https://notabug.org/attachments/27f1acca-9e89-49be-be26-d6a9ea8e45bb")
sha512sums=("066dad662d36bcc0079f3a678b6902008e2c492e53bd122d90b4d2715bbdcffe355b4e63fce1a5a33365e64193ddd7216f270fa0fa96cbe0889e54071da4b193"
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
