# Maintainer: Jayvee Enaguas <harvettfox96@protonmail.com>

pkgname=ttf-pixeloperator
pkgver=2018.10.04
pkgrel=1.1
_gitver=${pkgver}-1
pkgdesc="A libre/free raster proportional and monospace sans serif typeface."
url="https://notabug.org/HarvettFox96/${pkgname}"
license=("CC0")
arch=("any")
depends=("fontconfig" "xorg-font-utils" "xorg-fonts-encodings")
source=("https://notabug.org/HarvettFox96/${pkgname}/archive/${_gitver}.tar.gz"
        "${_gitver}.tar.gz.sig::https://notabug.org/attachments/b1905cb0-37e1-47e7-9eda-1807eca6b4b6")
sha512sums=("957e6928b81d2e6715416d7f42bc5dc8b7154b3e9cafb76b7f68b9e0857b31a3dd112bb06f2c81b4e9115a05f4428a1e3510e2069c73861f70c8a00dc719b782"
            "SKIP")
validpgpkeys=("925C741082DC0DB32CF8AADFCB73A6EB26948E91")

prepare() {
  tar -zxvf ${_gitver}.tar.gz;
  mv -v ${pkgname}/{LICENSE,ttf/*.ttf} "${srcdir}/";
}

package() {
  install -dm755 "${pkgdir}/usr/share/fonts/TTF/";
  install -Dm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/";
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE";
  rm -frv "${srcdir}/"*;
}
