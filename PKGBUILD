# Maintainer: Jayvee Enaguas <harvettfox96@protonmail.com>

pkgname=ttf-moderndos
pkgver=20190101.01
pkgrel=2
pkgdesc="A raster monospace serif typeface based on IBM and Verite, extracted from VGA ROMs in real machines by various manufacturers."
url="https://notabug.org/HarvettFox96/${pkgname}"
license=("CC0")
arch=("any")
depends=("fontconfig" "xorg-font-utils" "xorg-fonts-encodings")
source=("https://notabug.org/HarvettFox96/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgver}.tar.gz.sig::https://notabug.org/attachments/c8286466-0381-430d-b9fd-df16839e610f")
sha512sums=("17cd42e18a4df2b7a74f2476fab68cbc779c9faa4c027213832828da34905061a179c2713c8b247ab0f3e4d02d57168f30b3a76b3d45e963747a46472a20e4ca"
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
