# Maintainer: Groctel <aur@taxorubio.com>
# shellcheck disable=SC2034,SC2154,SC2164


_name=fb2converter
pkgname=fb2converter-bin
pkgver=1.78.4
pkgrel=1
pkgdesc="Unified converter of FB2 files into epub2, kepub, mobi and azw3 formats."

arch=("x86_64")
license=("GPL-3.0-only")
url="https://github.com/rupor-github/$_name"

source=("$url/releases/download/v$pkgver/fb2c-linux-amd64.zip")
sha512sums=('615d2ee4b4829f2454c8ccc6174cc22d0b698d112bf81db3086ce6b2df376a12bb5149a9cc5923f473fdc1b24420cd9ed22cd410ac9cebc0e6acb67213fa7f54')

provides=("fb2c" "kindlegen")
conflicts=("kindlegen")

package () {
    install -D -m755 fb2c "$pkgdir/usr/bin/fb2c"
    install -D -m755 kindlegen "$pkgdir/usr/bin/kindlegen"
    install -D -m644 /usr/share/licenses/spdx/GPL-3.0-only.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
