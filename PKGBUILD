# Maintainer: Jayvee Enaguas <harvettfox96@airmail.cc>

pkgname=ttf-aireexterior
pkgver=20190503.01
pkgrel=1
pkgdesc="A geometric sans serif typeface based on the title screen of the 1959 film Plan 9 from Outer Space, superseded from Aero Matics."
url="https://notabug.org/HarvettFox96/${pkgname}"
license=("CC0-1.0")
arch=("any")
depends=("fontconfig" "xorg-font-utils" "xorg-fonts-encodings")
source=("AireExterior-${pkgver}.zip::https://notabug.org/attachments/8ab176a2-3b12-4d98-b2be-5c077a11733e"
        "AireExterior-${pkgver}.zip.sig::https://notabug.org/attachments/74725915-7e8b-486a-b56e-7ff23158b7c0")
sha512sums=("4e5ba21060b97a1202875638c05c671a3f2f1f2c033eeedcc6328c8eda1d8980412d7ad4514d4336771b868344837e8e6e74d1cf893c9d07becb7d175574e17b"
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
