# Maintainer: Chewing_Bever
# Contributor: Slacker
pkgname=cronicle
pkgver=0.9.52
pkgrel=2
pkgdesc="A simple, distributed task scheduler and runner"
arch=('any')
url="https://github.com/jhuckaby/Cronicle"
license=('MIT')
depends=('nodejs' 'npm')
source=("https://github.com/jhuckaby/Cronicle/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9522e42043122cf9f7aab403db49cdcd018f6962773eef9e2d576513ae52411a')
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
