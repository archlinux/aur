# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

_pkgname=advancely
pkgname=$_pkgname-bin
pkgver=1.0.0
pkgrel=7
pkgdesc="A highly customizable and interactive tool to track Minecraft progress beyond just Advancements."
arch=('x86_64')
url="https://github.com/LNXSeus/Advancely"
license=(LicenseRef-Proprietary)
depends=(unzip sdl3 sdl3_image sdl3_ttf curl)
source=("Advancely.zip::$url/releases/download/v${pkgver}/Advancely-v${pkgver}-Linux.zip"
        "launcher"
        "icon.png"
        "advancely.desktop"
        "LICENSE")
sha256sums=('5ff6a2e74ddfa1fec86ded6a78b291a1ce8389b65f9de8078b4c9c0d1f7b8d43'
            '82ce0179d8df83b5fb76a73f6fb9c6075d1efe4e1ff52828888cf0df07849666'
            '0bb1507a70774b586b1c40783e48653df9fd715b624196b87a106dbd347fda3c'
            '9318f61c7d6a31db2f9d435e15070e7d5e21e7de56a9a3fee923b763db23dbfa'
            '7c18cf9f6781c08003aa13fe9ce08ebdf9b54f61fc806d77d29a51e925142b36')

prepare() {
  echo $pkgver > version
  unzip Advancely.zip -d sources
}

package() {
  install -D -m 755 "launcher" "${pkgdir}/usr/bin/advancely"
  install -D -m 644 "Advancely.zip" "${pkgdir}/usr/share/Advancely/Advancely.zip"
  install -D -m 755 "sources/Advancely" "${pkgdir}/usr/share/Advancely/Advancely"

  install -D -m 644 "icon.png" "${pkgdir}/usr/share/pixmaps/advancely.png"
  install -D -m 755 "advancely.desktop" "${pkgdir}/usr/share/applications/advancely.desktop"

  install -D -m 644 "version" "${pkgdir}/usr/share/Advancely/version"
  install -D -m 644 "LICENSE" "${pkgdir}/usr/share/licenses/advancely-bin/LICENSE"
}
