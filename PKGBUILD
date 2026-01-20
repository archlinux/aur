# Contributor: Erkin Batu Altunbaş <erkin@sdf.org>
pkgname=eisl
pkgver=5.62
pkgrel=1
pkgdesc="Easy-ISLisp is an interpreter and compiler compatible with ISLisp standard."
arch=('x86_64' 'i686')
url="https://github.com/sasagawa888/eisl"
license=("custom")
depends=("sh" "gcc" "make")
#_v=ｖ
_v=v
source=("https://github.com/sasagawa888/eisl/archive/${_v}${pkgver}.tar.gz")
sha256sums=('e4e3772e5aa627f64656826259ff9ce8bc15e91379b10905d32f075eabbb961b')

package()
{
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" PREFIX="/usr" install
    install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
