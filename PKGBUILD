# Maintainer: Jayvee Enaguas <harvettfox96@airmail.cc>

pkgname=ttf-aireexterior
pkgver=20190503.02
pkgrel=1
pkgdesc="A geometric sans serif typeface based on the title screen of the 1959 film Plan 9 from Outer Space, superseded from Aero Matics."
url="https://notabug.org/HarvettFox96/${pkgname}"
license=("OFL-1.1")
arch=("any")
depends=("fontconfig" "xorg-font-utils" "xorg-fonts-encodings")
source=("AireExterior-${pkgver}.zip::https://notabug.org/attachments/30c3c7b9-7f1a-465c-884f-ff9cb2cc064e"
        "AireExterior-${pkgver}.zip.sig::https://notabug.org/attachments/5b9c9c9a-6929-4a3e-811d-204865c5b9c9")
sha512sums=("d2d7030d2db16d14f9d50afc76b88a90ba1922d45f6de87900008860f7f98ff84aa720940c6c47a0999e1d609879ca554582ee9febf757d67a5cae0901e26959"
            "SKIP")
validpgpkeys=("30E2144356008681839AE9C192F8F52D258B63E6"
              "4C565E3C3DB4DE43785F0DA9B627DC6AB09D9B83")

prepare() {
  # Convert format to Unix by removing all carriage return characters

  sed -e 's/\r//g' LICENSE.txt > LICENSE;
}

package() {
  # Install font file(s)

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/";
  install -Dm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/";

  # Install licence file

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE";

  # Clean all files in the source directory

  rm -fr "${srcdir}/"*;
}
