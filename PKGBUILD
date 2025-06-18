# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgbase=wargames-terminal
pkgname=(otf-wargames-terminal ttf-wargames-terminal)
pkgver=1.0
pkgrel=1
pkgdesc='Terminal fonts from WarGames movie'
arch=('any')
url='https://mw.rat.bz/wgterm/'
license=('CC-BY-NC-SA-4.0')
source=("${pkgname}-${pkgver}.zip::https://mw.rat.bz/wgterm/WarGames%20Terminal%20Fonts.zip")
b2sums=('45bd63b01da7e6447199d34893f69692e1163cb278da83633986bf997471ba47a477717d952cf27afa330e9f089a9b04dc49f7d0ae4bff233ddc8b1ab3edfd88')

prepare() {
  # Replace spaces with hyphens in filenames
  for file in *{otf,ttf}; do
    mv "${file}" "${file// /-}"
  done
}

package_otf-wargames-terminal() {
  install -dm755 ${pkgdir}/usr/share/fonts/OTF/
  install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
}

package_ttf-wargames-terminal() {
  install -dm755 ${pkgdir}/usr/share/fonts/TTF/
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
}
