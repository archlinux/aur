# Maintainer: Malachi Soord <me@malachisoord.com>

pkgname=monsoon
pkgver=0.4.0
pkgrel=1
pkgdesc="A fast HTTP enumerator that allows you to execute a large number of HTTP requests."
arch=('x86_64')
url="https://github.com/RedTeamPentesting/monsoon"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.zip::https://github.com/RedTeamPentesting/monsoon/archive/v$pkgver.zip")
sha512sums=('5ad59f63db671c37657361e11aa37e29f19a9c61e15527c988b3a0fddfb6610f2b6f0244de606f9a2532e7d5cf2c4906467c94595a42b30ead0a4dcdadc72eef')

build() {
    cd $pkgname-$pkgver
    go build -trimpath -o $pkgname .
}

package() {
    cd $pkgname-$pkgver
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
