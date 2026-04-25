# Maintainer: Nicolas Chevalier <nickknight@netc.fr>
pkgname=wormix
pkgver=0.1.0
pkgrel=1
pkgdesc="ASCII artillery game for the terminal — physics, wind, sound, music"
arch=('any')
url="https://codeberg.org/nickknight/wormix"
license=('MIT')
depends=('python')
optdepends=('mpv: smoother background music with live volume control')
makedepends=('make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('24fc453f408136911dc6c07bcbf23b29c3ebf7a62a0750176e08f4cfd2b4e04d')  # filled in via `updpkgsums` after the v0.1.0 tag is pushed

build() {
    cd "$srcdir/$pkgname"
    make zipapp
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 wormix    "$pkgdir/usr/bin/wormix"
    install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
