# Maintainer: Jayvee Enaguas <harvettfox96@airmail.cc>

pkgname=ttf-moderndos
pkgver=20190101.02
pkgrel=4
pkgdesc="A raster monospace serif typeface based on IBM and Verite, extracted from ROM fonts part of various computers."
url="https://notabug.org/HarvettFox96/${pkgname}"
license=("CC0-1.0")
arch=("any")
depends=("fontconfig" "xorg-font-utils" "xorg-fonts-encodings")
source=("https://notabug.org/HarvettFox96/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgver}.tar.gz.sig::https://notabug.org/attachments/0a70c629-b0ca-496c-a2b7-d0dd2a0104bd")
sha512sums=("048d21810c7c1610460abe5edd03b4aab33d9256db81fba7523cbafa4ba255426674150792d7a3c3929fda392e2eb013e3c366cffcad027639b2ef3f1cb2fa1c"
            "SKIP")
validpgpkeys=("30E2144356008681839AE9C192F8F52D258B63E6"
              "4C565E3C3DB4DE43785F0DA9B627DC6AB09D9B83")

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
