# Maintainer: Chewing_Bever
# Contributor: Slacker
pkgname=cronicle
pkgver=0.9.53
pkgrel=2
pkgdesc="A simple, distributed task scheduler and runner"
arch=('any')
url="https://github.com/jhuckaby/Cronicle"
license=('MIT')
depends=('nodejs' 'npm')
source=("https://github.com/jhuckaby/Cronicle/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('47a78d475b58977f663a4c1fbfbd76d432dc8ad2e33798e0af515072057ce256')
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
