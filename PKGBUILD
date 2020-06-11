# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Co-Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Franck Stauffer

pkgname='firefox-extension-canvasblocker'
pkgver=1.3
pkgrel=1
pkgdesc="A Firefox extension to protect from being fingerprinted"
license=('MPL2')
arch=('any')
url="https://github.com/kkapsner/CanvasBlocker"
depends=("firefox")
groups=('firefox-addons')
source=("$pkgname-$pkgver.xpi::https://github.com/kkapsner/CanvasBlocker/releases/download/$pkgver/canvasblocker.xpi"
	"https://github.com/kkapsner/CanvasBlocker/archive/$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.xpi")
sha256sums=('dfb8aa888cf3b4671710861a65f0fe29810210f6a37c3d0c1a9bf3d112af4bb6'
            'a309c513ea13de3556dac3649583d13fcac86f9625673a58c57cbdae9b1d7138')
package() {
  cd "$srcdir"
  install -Dm644 "$pkgname-$pkgver.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/CanvasBlocker@kkapsner.de.xpi"

  cd "$srcdir/CanvasBlocker-$pkgver"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
