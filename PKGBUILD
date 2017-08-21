# Maintainer: Alwyn Kik <alwyn@proteon.com>
pkgname=rundeck-cli
pkgver=1.0.16
pkgrel=1
pkgdesc='CLI tool for Rundeck'
url="https://github.com/rundeck/rundeck-cli"
license=('Apache')
arch=('any')
depends=('java-runtime-headless')
source=("$url/releases/download/v$pkgver/rd-$pkgver.zip")
sha256sums=('23c978cac5c1645a2817c67fc5e02263ba38497ca8c9a5bdd7bb724672022863')

prepare() {
    cd "$srcdir"
    # We don't need no batch here!
    rm "rd-$pkgver/bin/rd.bat"
    mkdir -p "$pkgdir/usr"
}

package() {
    cd "$srcdir"
    cp -r "rd-$pkgver" "$pkgdir/usr"
}

