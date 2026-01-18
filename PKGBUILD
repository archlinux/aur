# Maintainer: https://github.com/theblu3j
# Created mostly for personal usage, and therefore maintained as such, but on the AUR for a few friends.

pkgname=dedupe-dir
pkgver=0.4.4
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
sha512sums=('5b9b56440fefc5960a15694f4ec6e10a75a96c37454d728c2c587e3ce57b072b7ac5c394622ad96ff276ed9a7446efea0f9f39792feb51e7b19f12f23393b787'
            '50e63f594d508ea3125eb2ce769275ea42e2dd93f9187284526af53816259eb6b0019576e4041e41f1d4dacdc48047615f3d92f85992fe50195de855f72cb6e0'
            '9dc42dccd3760ff70850c59beff66687e5aff2a4c577855003d14d214f14677cbefa18c37ef27bda82966c4791074600a3d4777a86d34f27a7dbfb4d4000975e'
            'a33658d9271e5c537ccd41bf540b463ad2a5eca4a060c80486ff42a736f0aa042d10436e7177c34d792177cb11285243dee1f31c4df54fb0bfaabbc306406930')
package() {
    install -Dm644 "$srcdir/dedupe.timer" "$pkgdir/usr/lib/systemd/user/dedupe.timer"
    install -Dm644 "$srcdir/dedupe.service" "$pkgdir/usr/lib/systemd/user/dedupe.service"
    install -Dm755 "$srcdir/dedupe.sh" "$pkgdir/usr/bin/dedupe"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
