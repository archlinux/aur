# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="pretzel-web"
pkgver=1.0.0
pkgrel=1
pkgdesc="Open-source, browser-local data exploration using DuckDB-Wasm and PRQL"
url="https://pretzelai.github.io/"
license=("Apache-2.0")
arch=("any")
makedepends=("npm")
source=("$pkgname.tar.gz::https://github.com/pretzelai/pretzelai/archive/refs/heads/main.tar.gz")
b2sums=("SKIP")

build(){
 cd "pretzelai-main"
 npm install
 npm run build
}

package(){
 cd "pretzelai-main"
 install -d "$pkgdir/usr/share/webapps"
 mv "build" "$pkgdir/usr/share/webapps/pretzel"
}
