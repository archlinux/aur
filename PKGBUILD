# Maintainer: Slacker
pkgname=cronicle
pkgver=0.9.39
pkgrel=1
pkgdesc="Cronicle - A simple, distributed task scheduler and runner"
arch=('any')
url="https://github.com/jhuckaby/Cronicle"
license=('MIT')
depends=('nodejs' 'npm')
source=("https://github.com/jhuckaby/Cronicle/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d66c2e3709e01efdd76c1a9215e2817a36abad6d4af2a715d022048513b8337e') 

prepare() {
    cd "$srcdir/Cronicle-$pkgver"
}

build() {
    cd "$srcdir/Cronicle-$pkgver"
    npm install
    node bin/build.js dist
}

package() {
    cd "$srcdir/Cronicle-$pkgver"
    install -d "$pkgdir/opt/cronicle"
    cp -a ./* "$pkgdir/opt/cronicle/"
}
