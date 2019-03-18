# Maintainer: Jayvee Enaguas <harvettfox96@protonmail.com>

pkgname=ttf-genericmobile
pkgver=20190103.02
pkgrel=1
pkgdesc="A raster proportional sans serif typeface, extracted from various generic/knockoff mobile devices."
url="https://notabug.org/HarvettFox96/${pkgname}"
license=("CC0-1.0")
arch=("any")
depends=("fontconfig" "xorg-font-utils" "xorg-fonts-encodings")
source=("https://notabug.org/HarvettFox96/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgver}.tar.gz.sig::https://notabug.org/attachments/e667a285-c529-4ae2-8134-bb514d89765b")
sha512sums=("902e2ad65fbbf355728742aebe3290eefaade2590cc7f046c38c37a9f72ade65854676b06b29ff71f79f9bea5cad6ccd736cdafcbcc8aaa42a05ca56a87e1d6a"
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
