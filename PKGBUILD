# Maintainer: Alwyn Kik <alwyn@proteon.com>
pkgname=rundeck-cli
pkgver=1.0.26
pkgrel=1
pkgdesc='CLI tool for Rundeck'
url="https://github.com/rundeck/rundeck-cli"
license=('Apache')
arch=('any')
depends=('java-runtime-headless')
source=("$url/releases/download/v$pkgver/rd-$pkgver.zip")
sha256sums=('250ffcc501c60aa46b8570cb1e02bae411af3f66f5b35edc5e2a034e1858861a')

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

