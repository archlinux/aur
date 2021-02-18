# Maintainer: Alwyn Kik <alwyn@proteon.com>
pkgname=rundeck-cli
pkgver=1.3.4
pkgrel=1
pkgdesc='CLI tool for Rundeck'
url="https://github.com/rundeck/rundeck-cli"
license=('Apache')
arch=('any')
depends=('java-runtime-headless')
source=("$url/releases/download/v$pkgver/rd-$pkgver.zip")
sha256sums=('37f4011c16ffc2d40968011e8a0befde6b1d1df736048f007b5f855ec28dfef9')

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

