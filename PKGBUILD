# Maintainer: Groctel <aur@taxorubio.com>
# shellcheck disable=SC2034,SC2154,SC2164


_name=fb2converter
pkgname=fb2converter-bin
pkgver=1.77.3
pkgrel=1
pkgdesc="Unified converter of FB2 files into epub2, kepub, mobi and azw3 formats."

arch=("x86_64")
license=("GPL-3.0-only")
url="https://github.com/rupor-github/$_name"

source=("$url/releases/download/v$pkgver/fb2c-linux-amd64.zip")
sha512sums=('fe237f88f48158dac35801f81c2df4624e1aeb98edb315d4dec6e38241124549f7521111e5f122b2312b6803bd5b6c36943b959ade1e7acbaa6bb7bff4258db1')

provides=("fb2c" "kindlegen")
conflicts=("kindlegen")

package () {
    install -D -m755 fb2c "$pkgdir/usr/bin/fb2c"
    install -D -m755 kindlegen "$pkgdir/usr/bin/kindlegen"
    install -D -m644 /usr/share/licenses/spdx/GPL-3.0-only.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
