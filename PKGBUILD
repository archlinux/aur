# Maintainer: Ateles
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=sdrtop-bin
pkgver=0.6.8
pkgrel=1
pkgdesc='Terminal monitor for SDR hardware'
arch=('x86_64')
url='https://github.com/musithang/sdrtop'
license=('GPL-3.0')
depends=('glibc')
optdepends=(
    'hackrf: HackRF support'
    'rtl-sdr: RTL-SDR support'
    'soapysdr: SoapySDR support'
)
provides=('sdrtop')
conflicts=('sdrtop')

source_x86_64=("https://github.com/musithang/sdrtop/releases/download/v${pkgver}/sdrtop-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('ab345ce0232827217abd2823ad32bf13fda5512836fd24911ab0ea0b25f10a27')

package() {
    install -Dm755 "$srcdir/sdrtop-${pkgver}-x86_64-unknown-linux-gnu/sdrtop"    "$pkgdir/usr/bin/sdrtop"
    install -Dm644 "$srcdir/sdrtop-${pkgver}-x86_64-unknown-linux-gnu/LICENSE"   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/sdrtop-${pkgver}-x86_64-unknown-linux-gnu/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    cp -r          "$srcdir/sdrtop-${pkgver}-x86_64-unknown-linux-gnu/user_docs" "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 "$srcdir/sdrtop-${pkgver}-x86_64-unknown-linux-gnu/sdrtop.1"  "$pkgdir/usr/share/man/man1/sdrtop.1"
}
