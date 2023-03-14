# Maintainer: Darkpelz <lukeh@outlook.my>
pkgname=paping
pkgver=1.5.5
pkgrel=1
pkgdesc="TCP port testing, emulating the functionality of ping (port ping)"
arch=('x86_64')
url="https://code.google.com/archive/p/${pkgname/-bin/}/"
license=('MIT')
makedeps=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${pkgname/-bin/}/${pkgname/-bin/}_${pkgver}_source.tar.gz")
sha256sums=("9aae26fedde0d9994b4ffc56b1df9a5450b9d9f7c557b26413b9d8f8adde5684")

build() {
    cd "$srcdir"
    g++ -m64 ./src/print.cpp ./src/stats.cpp ./src/timer.cpp ./src/arguments.cpp ./src/i18n.cpp ./src/host.cpp ./src/socket.cpp ./src/main.cpp -o ./bin/paping
}

package() {
    cd "$srcdir/bin"
    install -D "paping" "$pkgdir/usr/bin/paping"
}
