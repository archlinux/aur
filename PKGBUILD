# Maintainer: Jayvee Enaguas <harvettfox96@protonmail.com>

pkgname=ttf-moderndos
pkgver=2018.09.29
_rel=1
pkgrel=1
pkgdesc="A raster monospace serif based on IBM and Verite, extracted from VGA ROM typefaces in real machines by various manufacturers."
url="https://notabug.org/HarvettFox96/ttf-moderndos"
arch=("any")
license=("CC0")
depends=("fontconfig" "xorg-font-utils" "xorg-fonts-encodings")
source=("https://notabug.org/HarvettFox96/${pkgname}/archive/${pkgver}-${_rel}.tar.gz")
sha512sums=("0d35ff15a82f441c69aaefa5644ee394dfcd974c55fb3c51aa692551b84c5496b19622aa81770438694a4deb4ac409f81b11256011c2fc527e5af5a84d38f23b")

prepare() {
  cd "${srcdir}/";
  tar -zxvf ${pkgver}-${_rel}.tar.gz;
  mv -v ${pkgname}/{LICENSE,ttf/*.ttf} "${srcdir}/";
  rm -frv ${pkgname}/;
}

package() {
  install -dm755 "${pkgdir}/usr/share/fonts/TTF/";
  install -Dm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/";
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE";
}
