# Maintainer: Leonie Ain <me@koyu.space>

pkgname="bbz-cloud"
pkgver="2.1.5"
pkgrel="1"
pkgdesc="Die Desktop-App für die BBZ Cloud - eine All-in-One-Plattform für Unterricht und Zusammenarbeit"
arch=("x86_64")
url="https://github.com/dclausen01/bbzcloud-2"
license=("MIT")
depends=("http-parser" "minizip" "re2")
_filename="BBZ-Cloud-${pkgver}-x64.pacman"
source=("$url/releases/download/v${pkgver}/${_filename}")
noextract=("${_filename}")
sha256sums=('e2c5f25ee83ad96031d226472c4af4710efcde55c0351c19b658f982d0102f2e')
options=(!strip)
conflicts=("bbz-cloud-sus")

package() {
  tar -xJv -C "${pkgdir}" -f "${srcdir}/${_filename}" usr opt
  mkdir "$pkgdir/usr/bin"
  ln -s "/opt/BBZ Cloud/bbzcloud" "$pkgdir/usr/bin/bbzcloud"
  sed -i -e "s/Icon=bbzcloud/Icon=\/usr\/share\/icons\/hicolor\/0x0\/apps\/bbzcloud.png/" "$pkgdir"/usr/share/applications/bbzcloud.desktop
}

# vim:set ts=4 sw=4 et: syntax=sh
