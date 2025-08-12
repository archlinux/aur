# Maintainer: Groctel <aur@taxorubio.com>
# shellcheck disable=SC2034,SC2154,SC2164


_name=fb2converter
pkgname=fb2converter-bin
pkgver=1.78.1
pkgrel=1
pkgdesc="Unified converter of FB2 files into epub2, kepub, mobi and azw3 formats."

arch=("x86_64")
license=("GPL-3.0-only")
url="https://github.com/rupor-github/$_name"

source=("$url/releases/download/v$pkgver/fb2c-linux-amd64.zip")
sha512sums=('fd6851571076378c20217ab389064c1e74cebb5f2d86fc53d49ee1b3a592316cd2d3ebb67f4be75b683f90a8e9e4b0c33f9472fb70be87c14df1e90dae37674a')

provides=("fb2c" "kindlegen")
conflicts=("kindlegen")

package () {
    install -D -m755 fb2c "$pkgdir/usr/bin/fb2c"
    install -D -m755 kindlegen "$pkgdir/usr/bin/kindlegen"
    install -D -m644 /usr/share/licenses/spdx/GPL-3.0-only.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
