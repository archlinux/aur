# Maintainer: Vukky <hi at sus dot omg dot lol>
pkgname=saladbind
pkgver=1.7.1
pkgrel=1
pkgdesc='A tool for Salad to customize your miner'
arch=('x86_64')
url="https://github.com/LITdevs/SaladBind"
license=('GPL3')
makedepends=('nodejs' 'npm')
source=("https://github.com/LITdevs/SaladBind/archive/v$pkgver.tar.gz")
sha256sums=('4904285c19ed59cafc76f1b34dddfd549ee90a32cd390db8365cd65e82b76065')
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
