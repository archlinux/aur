# Maintainer: shtrophic < christoph at liebender dot dev >

pkgname=avocado
pkgver=1.0.0
pkgrel=1
pkgdesc="Vector Drawable optimization tool"
arch=(any)
url="https://github.com/alexjlockwood/$pkgname"
license=(MIT)
depends=(nodejs)
makedepends=(npm)
provides=(nodejs-avocado)
_archive="$pkgname-$pkgver"
source=("https://registry.npmjs.org/$pkgname/-/$_archive.tgz")
noextract=("$_archive.tgz")
sha256sums=('4af9e6851f9fb5e1b1ec10be8501abec188934ce89590be802c68e8dc6604e08')

package() {
    npm install -g --prefix "$pkgdir/usr" "$_archive.tgz"
    find "$pkgdir/usr" -type d -exec chmod 755 {} +
    chown -R root:root "$pkgdir"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE"
    unlink "$pkgdir/usr/bin/avdo"
}
