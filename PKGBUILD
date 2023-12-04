# Maintainer: Alwyn Kik <alwyn at kik dot pw>
pkgname=rundeck-cli
pkgver=2.0.8
pkgrel=1
pkgdesc='CLI tool for Rundeck'
url="https://github.com/rundeck/rundeck-cli"
license=('Apache')
arch=('any')
depends=('java-runtime-headless')
source=("$url/releases/download/v$pkgver/rd-$pkgver.zip")
sha256sums=('6a3ecdf6610542f879ab23e9d65acce8f38ff63d25d03523ddb35e0524a4aafb')

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

