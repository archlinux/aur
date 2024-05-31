# Maintainer: Malachi Soord <me@malachisoord.com>

pkgname=monsoon
pkgver=0.9.2
pkgrel=1
pkgdesc="A fast HTTP enumerator that allows you to execute a large number of HTTP requests."
arch=('x86_64')
url="https://github.com/RedTeamPentesting/monsoon"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.zip::https://github.com/RedTeamPentesting/monsoon/archive/v$pkgver.zip")
sha512sums=('b96f62d4057a8d9e88163456bde0f0b498fe60097f363e962084a60b0ff7beccce10bb5fa9df117e9dc5c90aaeb048460cc899e82205c4c98640256ae830ebc6')

build() {
    cd $pkgname-$pkgver
    go build -trimpath -o $pkgname .
}

package() {
    cd $pkgname-$pkgver
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
