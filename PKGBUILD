# Maintainer: Groctel <aur@taxorubio.com>
# shellcheck disable=SC2034,SC2154,SC2164


_name=fb2converter
pkgname=fb2converter-bin
pkgver=1.78.3
pkgrel=1
pkgdesc="Unified converter of FB2 files into epub2, kepub, mobi and azw3 formats."

arch=("x86_64")
license=("GPL-3.0-only")
url="https://github.com/rupor-github/$_name"

source=("$url/releases/download/v$pkgver/fb2c-linux-amd64.zip")
sha512sums=('4e81504f4adfc11af6a80315e29b6076aab4f18e8d92717bd4f344b6dd36375f2930b0a999de88594e6184c117deaced8181fc6d79b6ff7bf664bd26dcf67f4e')

provides=("fb2c" "kindlegen")
conflicts=("kindlegen")

package () {
    install -D -m755 fb2c "$pkgdir/usr/bin/fb2c"
    install -D -m755 kindlegen "$pkgdir/usr/bin/kindlegen"
    install -D -m644 /usr/share/licenses/spdx/GPL-3.0-only.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
