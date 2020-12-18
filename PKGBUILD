# Maintainer: Erkin Batu Altunbaş <erkin@sdf.org>
pkgname=eisl
pkgver=1.5
pkgrel=1
pkgdesc="Easy-ISLisp is an interpreter and compiler compatible with ISLisp standard."
arch=('x86_64' 'i686')
url="https://github.com/sasagawa888/eisl"
license=("custom")
depends=("sh" "gcc" "make")

source=("https://github.com/sasagawa888/eisl/archive/v${pkgver}.tar.gz")
sha256sums=('25670a105543babc5cb94a8d5ffe4b4a30f64087e3710929c6a17355a675ca89')

package()
{
    cd "$pkgname-$pkgver"
    make eisl

    install -d "$pkgdir/usr/share/$pkgname"
    cp -ra --no-preserve=ownership bench example test "$pkgdir/usr/share/$pkgname"

    install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"

    install -Dm755 eisl "$pkgdir/usr/bin/eisl"
}
