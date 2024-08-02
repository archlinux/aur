# Maintainer: Hildigerr Vergaray <Maintainer@YmirSystems.com>

pkgname=alephone-rubiconx
pkgver=1.0
pkgrel=2
pkgdesc="The unofficial fourth chapter in the Marathon series."
arch=('any')
url="http://www.marathonrubicon.com/"
license=('unknown')
depends=('alephone')
source=("https://files5.bungie.org/marathon/marathonRubiconX_20240421.zip"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('4c7821cf490b0236b20935da1d1a2e57d34abee818f0bbf01e77719a3ac73d70'
            '6c946c9262d7c9b0a18d9622686bc4c5e417534c0dd4728dc3fb693310cd833a'
            '6d9dca34cc18a095611565b13c360ebf06ae80cbbafd4b87d7e205ac6d60ca80')

prepare() {
  find "Rubicon X" -type f -name ".DS_Store" -delete
}

package() {
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -d "$pkgdir"/usr/share/AlephOne/scenarios
  cp -r "Rubicon X" "$pkgdir"/usr/share/AlephOne/scenarios/rubiconx
  find "$pkgdir"/usr/share/AlephOne/scenarios/rubiconx -type f -exec chmod 644 {} \;
}
