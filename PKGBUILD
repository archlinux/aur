# Maintainer: Hildigerr Vergaray <Maintainer@YmirSystems.com>

pkgname=alephone-red
pkgver=1.0
pkgrel=1
pkgdesc="A total conversion scenario for Marathon Infinity created by Ian McConville"
arch=('any')
url="http://bighouse.bungie.org/red/"
license=('unknown')
depends=('alephone')
source=("http://files3.bungie.org/trilogy/MarathonRED.zip"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('fc61a33f47054f0967769a2fb15a38567b98d93114f7e9b6fd69d89da9d523dc'
            'c46633189ec6b5dc09ce460aa1c119528863ffd598b6fc905e263a46096ab1c6'
            'cfb344eb5c198b03fc4cdaa97660156df3a127858ffbb2ee99d3174e610fc9c1')

package() {
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -d "$pkgdir"/usr/share/AlephOne/scenarios
  cp -r "Marathon RED" "$pkgdir"/usr/share/AlephOne/scenarios/red
  find "$pkgdir"/usr/share/AlephOne/scenarios/red -type f -exec chmod 644 {} \;
}
