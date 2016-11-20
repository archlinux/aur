# Maintainer: Jason White <jasonaw0 at gmail dot com>
pkgname=button
pkgver=0.1.2
pkgrel=1
pkgdesc="A fast, correct, and robust build system"
arch=('i686' 'x86_64')
url="https://github.com/jasonwhite/$pkgname"
license=('MIT')
depends=('sqlite' 'strace' 'button-lua')
makedepends=('dmd' 'dub')
source=("https://github.com/jasonwhite/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('4e10288ebcbf6d25d92f82dead5494ed')

build() {
    cd "$pkgname-$pkgver"
    dub build --build=release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
