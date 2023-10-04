# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=aurupdate
pkgdesc="Collection of scripts to automatically update packages from 'aur shaped' repositories"
pkgver=1.0.1
pkgrel=1
arch=("any")
url="https://github.com/vbouchaud/aur/tree/main/aurupdate"
license=("MIT")
depends=(
    git
)

sha256sums=(
    35e3cbe726e28f2f624acbe4fce8af09715e55537df7aa22ac89f00cde399515
    6b479a553d833811b50db26f7dbf6195594231fae2d54bc90bb1aa8277774b5f
    9de26037ef4fe25edd5c9997bab42ed42f41f77110c6d07a66a84d223e428b54
    f26bfbb7b579185f7a56a1e7079eab4c0518571cc398e4e169d7621db573b400
)

source=(
    LICENSE::https://bouchaud.org/misc/MIT.txt
    aurupdate
    aurupdate.service
    aurupdate.timer
)

package() {
    install -D -m0755 "$srcdir/aurupdate" "$pkgdir/usr/bin/aurupdate"
    install -D -m0644 "$srcdir/aurupdate.service" "$pkgdir/usr/lib/systemd/user/aurupdate.service"
    install -D -m0644 "$srcdir/aurupdate.timer" "$pkgdir/usr/lib/systemd/user/aurupdate.timer"

    install -D -m0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
