# Maintainer: CallMeAlphabet
pkgname=timeit-bin
pkgver=23
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
sha256sums=('3e9d3754e23fa066daa641f1a8b7866c5c7e5a50f143129973e922171e4d1e45'
            '27be3790a2b2390e6ba2b8b1e16818b7ea369e1b044b3eb293ab7070def4a4e4')

check() {
    cd "$srcdir"
    sha256sum -c <(sed "s/timeit-x86_64-linux-musl/timeit-$pkgver/" "timeit-$pkgver.sha256")
}

package() {
    cd "$srcdir"
    install -Dm755 "timeit-$pkgver" "$pkgdir/usr/bin/timeit"
}
