# Maintainer: Jayvee Enaguas <harvettfox96@protonmail.com>

pkgname=ttf-moderndos
pkgver=2018.09.29
pkgrel=1.3
_gitver=${pkgver}-1
pkgdesc="A raster monospace serif based on IBM and Verite, extracted from VGA ROM typefaces in real machines by various manufacturers."
url="https://notabug.org/HarvettFox96/${pkgname}"
license=("CC0")
arch=("any")
depends=("fontconfig" "xorg-font-utils" "xorg-fonts-encodings")
source=("https://notabug.org/HarvettFox96/${pkgname}/archive/${_gitver}.tar.gz"
        "${_gitver}.tar.gz.sig::https://notabug.org/attachments/867df282-014d-4397-9dd4-cfbdf9330387")
sha512sums=("0d35ff15a82f441c69aaefa5644ee394dfcd974c55fb3c51aa692551b84c5496b19622aa81770438694a4deb4ac409f81b11256011c2fc527e5af5a84d38f23b"
            "SKIP")
verifypgpkeys=("925C741082DC0DB32CF8AADFCB73A6EB26948E91")

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
