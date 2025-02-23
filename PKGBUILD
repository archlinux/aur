# Maintainer: Malachi Soord <me@malachisoord.com>

pkgname=monsoon
pkgver=0.10.0
pkgrel=1
pkgdesc="A fast HTTP enumerator that allows you to execute a large number of HTTP requests."
arch=('x86_64')
url="https://github.com/RedTeamPentesting/monsoon"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.zip::https://github.com/RedTeamPentesting/monsoon/archive/v$pkgver.zip")
sha512sums=('f1acf743100d821e8c7a170d06fa42c7d21c16489ea7d47f200cf1e38c12f3ddc979f10a1fb3f2b42a9ae16a4292bc49f095f414adce573be038514b0e7c354b')

build() {
    cd $pkgname-$pkgver
    go build -trimpath -o $pkgname .
}

package() {
    cd $pkgname-$pkgver
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
