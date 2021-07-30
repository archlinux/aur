# Maintainer: Jose Riha <jose1711 [at] gmail (dot) com>

pkgname=kmcaster
pkgver=1.0.3
pkgrel=2
pkgdesc="On-screen display (OSD) for keyboard and mouse events"
arch=('any')
url="https://github.com/DaveJarvis/kmcaster"
license=('GPL')
depends=('archlinux-java-run')
makedepends=('gendesk')
source=("${pkgname}_${pkgver}.jar"::"https://github.com/DaveJarvis/kmcaster/releases/download/${pkgver}/kmcaster.jar"
        "kmcaster.sh")
noextract=("${pkgname}_$pkgver.jar")

prepare() {
  gendesk -f -n --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" --exec "kmcaster" --categories "Utility"
}

package() {
  install -Dm644 ${pkgname}_$pkgver.jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm755 kmcaster.sh "$pkgdir/usr/bin/kmcaster"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
md5sums=('feb59f5e21a0085f3fcd1e30e09c3cd1'
         'c89ecb10db8a6c447a956e5f4872a8bf')
