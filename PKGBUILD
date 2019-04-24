# Maintainer: Jayvee Enaguas <harvettfox96@airmail.cc>

pkgname=ttf-aireexterior
pkgver=20190422.02
pkgrel=1
pkgdesc="A geometric sans serif typeface based on the title screen of the 1959 film Plan 9 from Outer Space, superseded from Aero Matics."
url="https://notabug.org/HarvettFox96/${pkgname}"
license=("CC0-1.0")
arch=("any")
depends=("fontconfig" "xorg-font-utils" "xorg-fonts-encodings")
source=("AireExterior-${pkgver}.zip::https://notabug.org/attachments/009326bf-451a-4a0a-a653-9be5a75c0c64"
        "AireExterior-${pkgver}.zip.sig::https://notabug.org/attachments/80c10dd6-ed69-40af-b104-a0954cdded0d")
sha512sums=("7addf399411e1831890980ea9f72b44a96851d4847e5794878e9e9e15705936a5a0b01602991c70aa2fafb26bcab5f0bcbaf8584a646ed06fb67d3fbaa6709e8"
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
