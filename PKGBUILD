# Maintainer: Nicolas Chevalier <nickknight@netc.fr>
pkgname=wormix
pkgver=0.2.0
pkgrel=1
pkgdesc="ASCII artillery game for the terminal — physics, wind, sound, music"
arch=('any')
url="https://codeberg.org/nickknight/wormix"
license=('MIT')
depends=('python')
optdepends=('mpv: smoother background music with live volume control')
makedepends=('make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1e3f08742aacbc29bbf817d3301b7c94c03eaffa51938dc54590849a247ef46f')

build() {
    cd "$srcdir/$pkgname"
    make zipapp
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 wormix         "$pkgdir/usr/bin/wormix"
    install -Dm644 LICENSE        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md      "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 wormix.desktop "$pkgdir/usr/share/applications/wormix.desktop"
    install -Dm644 wormix.svg     "$pkgdir/usr/share/icons/hicolor/scalable/apps/wormix.svg"
}
