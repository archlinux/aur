# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
# Original PKGBUILD by Mario Finelli <mario at finel dot li>

pkgname=super-mario-4-jugadores
pkgver=2.0.5
pkgrel=1
pkgdesc="A fangame of Super Mario Bros. (uses Wine)"
arch=('i686' 'x86_64')
url="https://carlosxdjavgames.altervista.org/archivos/134/"
license=(custom)
depends=(wine desktop-file-utils)
makedepends=(p7zip wget)
source=("https://cdn.discordapp.com/attachments/630931682924429328/808555699637846026/SM4J2.0.5Fix.zip"
        "${pkgname}.sh"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "License.txt")
install="${pkgname}.install"
sha256sums=('9ae90076ccd567254d1c4d12c009aa51d511df24e7efc03d4404bb5f8ac15795'
            '458b44e169e0d8a263fddcb476ce70c7eefacbcc3e9617f2effaa81ceeeb1734'
            '8352f56fa923bc8e283ff091ffac508169d4563d92bab4ede2285bddbfe09cd9'
            '4d375657e6a90353aeeaf7d8687022dba9ec0dbba166603a7af29c0152e2a8b8'
            'e2333a34a96432b05241bf72e71f7b16207fa50e3165250cfc1008e360738b68')

package() {
  7z x "SM4J2.0.5Fix.zip" -o"${pkgdir}/usr/share/${pkgname}"

  # correct filesystem permissions
  find "${pkgdir}" -type d -execdir chmod 755 {} +

  install -Dm0644 "License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 ${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm0644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

