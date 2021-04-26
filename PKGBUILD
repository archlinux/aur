# Maintainer: Ludovic Fauvet <etix@l0cal.com>

pkgname=wombat-bin
_pkgname=wombat
pkgver=0.5.0
pkgrel=1
pkgdesc="A graphical gRPC client written in Go"
arch=('x86_64')
url="https://github.com/rogchap/wombat"
license=('MIT')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/rogchap/wombat/releases/download/v${pkgver}/Wombat_v${pkgver}_Linux_x86_64.tar.gz"
               "https://raw.githubusercontent.com/rogchap/wombat/master/appicon.png"
               "wombat.desktop")
depends=()
provides=("${_pkgname}")
sha256sums_x86_64=('fa53392ca4ddda6fd863d781482fb4ee57c4c9dd90f12859e6ccfb0814beb81d'
                   'dc2ce4559995ba723cdc4513f419abe941d7ac82e85f64f6870f37a96386e02d'
                   '8d6bf92c6eb1d7b73c48569c686e0f4b0951f16f0520d48b64ef4a02a1dfdac5')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir"/wombat.desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 "$srcdir"/appicon.png "$pkgdir"/usr/share/pixmaps/wombat.png
}
