# Maintainer: https://github.com/theblu3j
# Created mostly for personal usage, and therefore maintained as such, but on the AUR for a few friends.

pkgname=dedupe-dir
pkgver=0.4.3
pkgrel=1
pkgdesc='Dedupes directories of your choosing once a week.'
arch=('any')
url='https://github.com/theblu3j/dedupe-dir'
license=('0BSD')
depends=('systemd' 'duperemove' 'coreutils' 'grep' 'sh' 'sed')
source=(
    "dedupe.timer"
    "dedupe.service"
    "dedupe.sh"
    "LICENSE"
)
conflicts=('dedupe')
sha512sums=('684d92eb405789da7776224cd109e2dd7b739c1c45b37b28900b5326f348cfa3a521f2581a1cca4116341deaf663fb308013fae6d3ff811c9805c20b4ae064f9'
            'ab9a0e2be923fbc711addb78ab9bef42e507c76231d2cee7efb852949b77a07f450267ea9c77e38ddb5c20264e920dd2b787e5e52235ef287c84ffba3203cd86'
            '9dc42dccd3760ff70850c59beff66687e5aff2a4c577855003d14d214f14677cbefa18c37ef27bda82966c4791074600a3d4777a86d34f27a7dbfb4d4000975e'
            'a33658d9271e5c537ccd41bf540b463ad2a5eca4a060c80486ff42a736f0aa042d10436e7177c34d792177cb11285243dee1f31c4df54fb0bfaabbc306406930')
package() {
    install -Dm644 "$srcdir/dedupe.timer" "$pkgdir/usr/lib/systemd/user/dedupe.timer"
    install -Dm644 "$srcdir/dedupe.service" "$pkgdir/usr/lib/systemd/user/dedupe.service"
    install -Dm755 "$srcdir/dedupe.sh" "$pkgdir/usr/bin/dedupe"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
