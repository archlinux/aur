# Maintainer: Alwyn Kik <alwyn@proteon.com>
pkgname=rundeck-cli
pkgver=1.0.10
pkgrel=1
pkgdesc='CLI tool for Rundeck'
url="https://github.com/rundeck/rundeck-cli"
license=('Apache')
arch=('any')
depends=('java-runtime-headless')
source=("$url/releases/download/v$pkgver/rd-$pkgver.zip")
sha256sums=('4c4a9279baed6558510bfcbf8295743b04d438e49e6d31d21cdfeb608fd4a850')

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

