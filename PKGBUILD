# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kured-sentinel
pkgdesc="Pacman hook to create the sentinel file for kured."
pkgver=1.0.0
pkgrel=2
arch=("any")
url="https://github.com/vbouchaud/aur/tree/main/kured-sentinel"
license=("MIT")
depends=("longoverdue")

sha256sums=(
    35e3cbe726e28f2f624acbe4fce8af09715e55537df7aa22ac89f00cde399515
    c050b7b8b6bb244b16ad84c3d162b91ddbf9ebaeda423df7418e4ad646fe99b3
    9124af974ca641ff1421bc077ae6e4f7dae0704bf0ba7a7d6630d75afdbe1a06
)

source=(
    LICENSE::https://bouchaud.org/misc/MIT.txt
    kured-sentinel
    kured-sentinel.hook
)

package() {
    install -D -m0644 "$srcdir/kured-sentinel.hook" "$pkgdir/usr/share/libalpm/hooks/kured-sentinel.hook"
    install -D -m0755 "$srcdir/kured-sentinel" "$pkgdir/usr/bin/kured-sentinel"

    install -D -m0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
