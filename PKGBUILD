# Maintainer: https://github.com/theblu3j
# Created mostly for personal usage, and therefore maintained as such, but on the AUR for a few friends.

pkgname=dedupe-dir
pkgver=0.4.1
pkgrel=2
pkgdesc='Dedupes directories of your choosing once a week.'
arch=('any')
url='https://github.com/theblu3j/dedupe-dir'
depends=('systemd' 'duperemove' 'coreutils' 'grep' 'sh')
source=(
    "dedupe.timer"
    "dedupe.service"
    "dedupe.sh"
)
conflicts=('dedupe')
sha512sums=('684d92eb405789da7776224cd109e2dd7b739c1c45b37b28900b5326f348cfa3a521f2581a1cca4116341deaf663fb308013fae6d3ff811c9805c20b4ae064f9'
            'ab9a0e2be923fbc711addb78ab9bef42e507c76231d2cee7efb852949b77a07f450267ea9c77e38ddb5c20264e920dd2b787e5e52235ef287c84ffba3203cd86'
            'fd81eb4b4a80792748f1594712b85bc6823e6873eee853e500209301c034172738bd529cd3bc593866817a447a375d0aa062d7314e8ed1a3f803ee5c38db3ee5')
package() {
    mkdir -p "$pkgdir/usr/lib/systemd/user/"
    mkdir -p "$pkgdir/usr/bin/"
    install -Dm644 "$srcdir/dedupe.timer" "$pkgdir/usr/lib/systemd/user/dedupe.timer"
    install -Dm644 "$srcdir/dedupe.service" "$pkgdir/usr/lib/systemd/user/dedupe.service"
    install -Dm755 "$srcdir/dedupe.sh" "$pkgdir/usr/bin/dedupe"
}
