# Maintainer: Erkin Batu Altunbaş <erkin@sdf.org>
pkgname=eisl
pkgver=1.1
pkgrel=1
pkgdesc="Easy-ISLisp is an interpreter and compiler compatible with ISLisp standard."
arch=('x86_64' 'i686')
url="https://github.com/sasagawa888/eisl"
license=("custom")
depends=("sh" "gcc" "make")
optdepends=("edlis: editor for eisl")

source=("https://github.com/sasagawa888/eisl/archive/v${pkgver}.tar.gz")
sha256sums=('fc1c3b000887cf82dc655df2d8cf13d2ae8c0ca221e03ff6501be019cd5a79c7')

package()
{
    cd "$pkgname-$pkgver"
    make eisl

    install -d "$pkgdir/usr/share/$pkgname"
    cp -ra --no-preserve=ownership bench example test "$pkgdir/usr/share/$pkgname"

    install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"

    install -Dm755 eisl "$pkgdir/usr/bin/eisl"
}
