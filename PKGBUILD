# Maintainer: koyu.space <aur at koyu dot space>

pkgname="bbz-cloud"
pkgver="1.6.3"
pkgrel="1"
pkgdesc="Die Desktop-App für die BBZ Cloud - eine All-in-One-Plattform für Unterricht und Zusammenarbeit"
arch=("x86_64")
url="https://github.com/koyuawsmbrtn/bbz-cloud"
license=("MIT")
depends=("http-parser" "minizip" "re2")
_filename="bbzcloud-${pkgver}.pacman"
source=("$url/releases/download/v${pkgver}/${_filename}")
noextract=("${_filename}")
md5sums=("a6976b1d19e63e9bc761ec1e6a1e508f")
options=(!strip)
conflicts=("bbz-cloud-sus")

package() {
  tar -xJv -C "${pkgdir}" -f "${srcdir}/${_filename}" usr opt
  mkdir "$pkgdir/usr/bin"
  ln -s "/opt/BBZ Cloud/bbzcloud" "$pkgdir/usr/bin/bbzcloud"
  sed -i -e "s/Icon=bbzcloud/Icon=\/usr\/share\/icons\/hicolor\/0x0\/apps\/bbzcloud.png/" "$pkgdir"/usr/share/applications/bbzcloud.desktop
}

# vim:set ts=4 sw=4 et: syntax=sh
