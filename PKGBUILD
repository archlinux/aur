# Maintainer: CallMeAlphabet
pkgname=timeit-bin
pkgver=21
pkgrel=1
pkgdesc="timeit, a precise command timing utility, prebuilt binary"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/timeit"
license=('Apache-2.0')
depends=('gcc-libs')
provides=('timeit')
conflicts=('timeit')
source=("timeit-$pkgver::https://github.com/CallMeAlphabet/timeit/releases/download/latest/timeit-x86_64-linux-musl"
        "timeit-$pkgver.sha256::https://github.com/CallMeAlphabet/timeit/releases/download/latest/timeit-x86_64-linux-musl.sha256")
sha256sums=('SKIP' 'SKIP')

check() {
    cd "$srcdir"
    sha256sum -c <(sed "s/timeit-x86_64-linux-musl/timeit-$pkgver/" "timeit-$pkgver.sha256")
}

package() {
    cd "$srcdir"
    install -Dm755 "timeit-$pkgver" "$pkgdir/usr/bin/timeit"
}
