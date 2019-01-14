# Maintainer: Jayvee Enaguas <harvettfox96@protonmail.com>

pkgname=ttf-euroteletext
pkgver=20190114.01
pkgrel=1
pkgdesc="A raster monospace sans serif typeface, extracted from teletext services in few European countries."
url="https://notabug.org/HarvettFox96/${pkgname}"
license=("CC0-1.0")
arch=("any")
depends=("fontconfig" "xorg-font-utils" "xorg-fonts-encodings")
source=("https://notabug.org/HarvettFox96/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgver}.tar.gz.sig::https://notabug.org/attachments/61c31cd0-750a-4f6b-8f13-6bd29bb0acd5")
sha512sums=("986c8650c999a156daf761a9f3994542ca98f182371cad68fcbbc43e9a0f9cb461bb2fa6fe6e19f411e4f5e5d793112f53275df5a1fbe19329e52c6aab3a1fb9"
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
