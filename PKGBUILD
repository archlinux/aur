# Maintainer: Jayvee Enaguas <harvettfox96@airmail.cc>

pkgname=ttf-genericmobile
pkgver=20190323.01
pkgrel=2
pkgdesc="A raster proportional sans serif typeface, extracted from various generic/knockoff mobile devices."
url="https://notabug.org/HarvettFox96/${pkgname}"
license=("CC0-1.0")
arch=("any")
depends=("fontconfig" "xorg-font-utils" "xorg-fonts-encodings")
source=("https://notabug.org/HarvettFox96/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgver}.tar.gz.sig::https://notabug.org/attachments/ef72ae01-e642-4d72-9e5a-cd0395a045f8")
sha512sums=("65486775d996fb8543415f584f70d800b91dfda4dcb53576e5fc07ea233cdaab28cbb777ef5195c87c954467807925637d5187b7534c6e4ed1ab7f8c3f3a8a4b"
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
