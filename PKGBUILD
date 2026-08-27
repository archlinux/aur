# Maintainer: CallMeAlphabet
pkgname=fasthex-bin
pkgver=42
pkgrel=1
pkgdesc="fasthex, a very fast hex dumper, prebuilt binary"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/fasthex"
license=('Apache-2.0')
depends=('gcc-libs')
provides=('fasthex')
conflicts=('fasthex')
source=("fasthex-$pkgver::https://github.com/CallMeAlphabet/fasthex/releases/download/latest/fasthex-x86_64-linux-musl"
        "fasthex-$pkgver.sha256::https://github.com/CallMeAlphabet/fasthex/releases/download/latest/fasthex-x86_64-linux-musl.sha256")
sha256sums=('SKIP' 'SKIP')

check() {
    cd "$srcdir"
    sha256sum -c <(sed "s/fasthex-x86_64-linux-musl/fasthex-$pkgver/" "fasthex-$pkgver.sha256")
}

package() {
    cd "$srcdir"
    install -Dm755 "fasthex-$pkgver" "$pkgdir/usr/bin/fasthex"
}
