# Maintainer: koyu.space <aur at koyu dot space>

pkgname="bbz-cloud-sus"
pkgver="1.5.3"
pkgrel="2"
pkgdesc="Die Desktop-App für die BBZ Cloud - eine All-in-One-Plattform für Unterricht und Zusammenarbeit"
arch=("x86_64")
url="https://github.com/dclausen01/bbz-cloud-sus"
license=("MIT")
depends=("http-parser" "minizip" "re2")
_filename="bbzcloud-${pkgver}.pacman"
source=("$url/releases/download/v${pkgver}/${_filename}")
noextract=("${_filename}")
md5sums=("a8aaec539642384a7cec3670617b999e")
options=(!strip)
conflicts=("bbz-cloud")

package() {
  tar -xJv -C "${pkgdir}" -f "${srcdir}/${_filename}" usr opt
  mkdir "$pkgdir/usr/bin"
  ln -s "/opt/BBZ Cloud/bbzcloud" "$pkgdir/usr/bin/bbzcloud"
}

# vim:set ts=4 sw=4 et: syntax=sh
