# Maintainer: Erkin Batu Altunbaş <erkin@sdf.org>
pkgname=eisl
pkgver=1.7
pkgrel=1
pkgdesc="Easy-ISLisp is an interpreter and compiler compatible with ISLisp standard."
arch=('x86_64' 'i686')
url="https://github.com/sasagawa888/eisl"
license=("custom")
depends=("sh" "gcc" "make")

source=("https://github.com/sasagawa888/eisl/archive/v${pkgver}.tar.gz")
sha256sums=('7eb1a154b1d0cd11113ec3c45b4455a1a41b7d0558af4c13dd4237c2b4abdf3a')

package()
{
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" PREFIX="/usr" install
    install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
