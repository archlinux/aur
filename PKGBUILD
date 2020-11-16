# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Co-Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Franck Stauffer

pkgname='firefox-extension-canvasblocker'
pkgver=1.4
pkgrel=1
pkgdesc="A Firefox extension to protect from being fingerprinted"
license=('MPL2')
arch=('any')
url="https://github.com/kkapsner/CanvasBlocker"
depends=("firefox")
groups=('firefox-addons')
source=("$pkgname-$pkgver.xpi::https://github.com/kkapsner/CanvasBlocker/releases/download/$pkgver/canvasblocker.xpi"
        "$pkgname-$pkgver.tar.gz::https://github.com/kkapsner/CanvasBlocker/archive/$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.xpi")
sha256sums=('5b93c2371ba680c97b151bd0e63be4eddfad6d6ff0ed2c6b14940614b20d7115'
            'c515fcd565786399656ed3d22632a5590b5ef9aefea600ba7993e68a4488159e')
package() {
  cd "$srcdir"
  install -Dm644 "$pkgname-$pkgver.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/CanvasBlocker@kkapsner.de.xpi"

  cd "$srcdir/CanvasBlocker-$pkgver"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
