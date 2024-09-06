# Maintainer: Groctel <aur@taxorubio.com>
# shellcheck disable=SC2034,SC2154,SC2164


_name=fb2converter
pkgname=fb2converter-bin
pkgver=1.75.4
pkgrel=1
pkgdesc="Unified converter of FB2 files into epub2, kepub, mobi and azw3 formats."

arch=("x86_64")
license=("GPL-3.0-only")
url="https://github.com/rupor-github/$_name"

source=("$url/releases/download/v$pkgver/fb2c-linux-amd64.zip")
sha512sums=('d189166a9d8eeebc0f9a668e14a883ed1fe729d3421dac053902e33c181c0a209619c25ee7029f817fe7f03787c1f212ac7e02b65a6c7d7d6f85db67e8dfe2d8')

provides=("fb2c" "kindlegen")
conflicts=("kindlegen")

package () {
    install -D -m755 fb2c "$pkgdir/usr/bin/fb2c"
    install -D -m755 kindlegen "$pkgdir/usr/bin/kindlegen"
    install -D -m644 /usr/share/licenses/spdx/GPL-3.0-only.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
