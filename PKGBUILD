# Maintainer: Chewing_Bever
# Contributor: Slacker
pkgname=cronicle
pkgver=0.9.51
pkgrel=2
pkgdesc="A simple, distributed task scheduler and runner"
arch=('any')
url="https://github.com/jhuckaby/Cronicle"
license=('MIT')
depends=('nodejs' 'npm')
source=("https://github.com/jhuckaby/Cronicle/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('28af1f9932b89120271da1eeeba4e138eb1e276a5d40ec35710df6bc618d0e80')
backup=('opt/cronicle/conf/config.json')

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
