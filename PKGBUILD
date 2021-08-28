# Maintainer: 4679 <4679 at pm dot me>

pkgname=dcompass-bin
_pkgbase=dcompass
pkgver=20210812_0958
pkgrel=1
pkgdesc='A high-performance programmable DNS component aiming at robustness, speed, and flexibility (binary release)'
arch=('x86_64')
url='https://github.com/compassd/dcompass'
license=('GPL3')
provides=('dcompass')
conflicts=('dcompass')
source=("$_pkgbase::https://github.com/compassd/$_pkgbase/releases/download/build-$pkgver/dcompass-$CARCH-unknown-linux-musl-full"
        'dcompass@.service'
        'sysusers.conf')

sha512sums=('e2034c13e085641ab43998fbc277aea4b92013ccafed89fe26513d5c5760122103a840a8817ec186222e6fe8b58af3610800e05b2e8528674d0c9e39825524da'
            '306070613217509953f7d6b7054b1fcc3892c8cb10258381bd7c2bcd0ffc4804f2cd1eb1dfad290da9cff390e3000b7995554a5ad3c3e10e526ff593aa1c1671'
            'dba3cf9dde2749b0b8631f4dfcd84c66bda99023eac5f9e77728f4eafefe8f7e2ed338c48e75463b41bd0a97975b0259e3194c4ec9f2ba5ff5989c940c714838')

package() {
  install -Dm755 "$srcdir/${_pkgbase}" "${pkgdir}/usr/bin/${_pkgbase}"
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/dcompass.conf"
  install -Dm644 "$srcdir/dcompass@.service" "$pkgdir/usr/lib/systemd/system/dcompass@.service"
  install -dm755 "$pkgdir/etc/dcompass"
}
