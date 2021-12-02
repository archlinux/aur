# Maintainer: Vukky <hi at sus dot omg dot lol>
pkgname=saladbind
pkgver=1.7.0
pkgrel=1
pkgdesc='A tool for Salad to customize your miner'
arch=('x86_64')
url="https://github.com/LITdevs/SaladBind"
license=('GPL3')
makedepends=('nodejs' 'npm')
source=("https://github.com/LITdevs/SaladBind/archive/v$pkgver.tar.gz")
sha256sums=('ba454c0d1872b207cac51156bb11c8a975880d8c08a80afe35e0fc37ff1fda44')
options=("!strip")

build() {
    cd "SaladBind-$pkgver"
    npm install
    node node_modules/pkg/lib-es5/bin.js src/index.js --targets node16-linux-x64 --output bin/saladbind
}

package() {
    cd "SaladBind-$pkgver"
    install -Dm777 "bin/saladbind" "$pkgdir/usr/bin/$pkgname"
}
