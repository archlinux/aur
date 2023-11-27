# Maintainer: Groctel <aur@taxorubio.com>

_name=fb2converter
pkgname=fb2converter-bin
pkgver=1.72.2
pkgrel=1
pkgdesc="Unified converter of FB2 files into epub2, kepub, mobi and azw3 formats."

arch=("x86_64")
license=("GPL-3.0-only")
url="https://github.com/rupor-github/$_name"

source=("$url/releases/download/v$pkgver/fb2c_linux_amd64.zip")
sha512sums=('b8b915d1a509ad6d393647445779b5eece21e410fcbb2a7fd9570f8336cfb39feca57523af63c1d088e67eca121c7496b63180102fbd052cd58f548933a58594')

provides=("fb2c" "kindlegen")
conflicts=("kindlegen")

package () {
    # cd "$srcdir/$pkgname-$pkgver" || exit
    install -D -m755 fb2c "$pkgdir/usr/bin/fb2c"
    install -D -m755 kindlegen "$pkgdir/usr/bin/kindlegen"
    install -D -m644 /usr/share/licenses/common/GPL3/license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
