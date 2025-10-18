# Maintainer: https://github.com/theblu3j
# Created mostly for personal usage, and therefore maintained as such, but on the AUR for a few friends.

pkgname=dedupe-dir
pkgver=0.4
pkgrel=4
pkgdesc='Dedupes directories of your choosing once a week.'
arch=('any')
url='https://github.com/theblu3j/dedupe-dir'
depends=('systemd' 'duperemove' 'coreutils')
source=(
    "dedupe.timer::https://raw.githubusercontent.com/theblu3j/dedupe/refs/heads/main/dedupe.timer"
    "dedupe.service::https://raw.githubusercontent.com/theblu3j/dedupe/refs/heads/main/dedupe.service"
    "dedupe.sh::https://raw.githubusercontent.com/theblu3j/dedupe/refs/heads/main/dedupe.sh"
)
conflicts=('dedupe')
sha512sums=('684d92eb405789da7776224cd109e2dd7b739c1c45b37b28900b5326f348cfa3a521f2581a1cca4116341deaf663fb308013fae6d3ff811c9805c20b4ae064f9'
            'ab9a0e2be923fbc711addb78ab9bef42e507c76231d2cee7efb852949b77a07f450267ea9c77e38ddb5c20264e920dd2b787e5e52235ef287c84ffba3203cd86'
            'a1ef4a8b999d28b01e392f11f9a7e3af0228e8e88a724aada52f9ce55d8f5d905e9c9120e1794853cca35ae50c1983076b171dfef3981b497d8cdebca2d1ab88')
package() {
    mkdir -p "$pkgdir/usr/lib/systemd/user/"
    mkdir -p "$pkgdir/usr/bin/"
    install -Dm644 "$srcdir/dedupe.timer" "$pkgdir/usr/lib/systemd/user/dedupe.timer"
    install -Dm644 "$srcdir/dedupe.service" "$pkgdir/usr/lib/systemd/user/dedupe.service"
    install -Dm755 "$srcdir/dedupe.sh" "$pkgdir/usr/bin/dedupe"
}
