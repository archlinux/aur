# Maintainer: Erkin Batu Altunbaş <erkin@sdf.org>
pkgname=eisl
pkgver=1.01
pkgrel=1
pkgdesc="Easy-ISLisp is an interpreter and compiler compatible with ISLisp standard."
arch=('x86_64' 'i686')
url="https://github.com/sasagawa888/eisl"
license=("custom")
depends=("sh" "gcc" "make")

source=("https://github.com/sasagawa888/eisl/archive/v${pkgver}.tar.gz")
sha256sums=('4f159ba3e05b3c79b75134ee5f6b27f80e8ddbc9875cd62935d20809f5ffea60')

package()
{
    cd "$pkgname-$pkgver"
    make eisl

    install -d "$pkgdir/usr/share/$pkgname"
    cp -ra --no-preserve=ownership bench example test "$pkgdir/usr/share/$pkgname"

    install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"

    install -Dm755 eisl "$pkgdir/usr/bin/eisl"
}
