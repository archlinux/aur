# Maintainer: Vukky <hi at sus dot omg dot lol>
pkgname=saladbind
pkgver=1.7.1
pkgrel=2
pkgdesc='A tool for Salad to customize your miner'
arch=('x86_64')
url="https://github.com/LITdevs/SaladBind"
license=('GPL3')
makedepends=('nodejs' 'npm')
source=("https://github.com/LITdevs/SaladBind/archive/v$pkgver.tar.gz")
sha256sums=('44bebca62a44ad3d523fd87b467c4bae9c0608579fc226e6dd3a22b1f26fd6d5')
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
