# Maintainer: CallMeAlphabet
pkgname=fasthex-bin
pkgver=44
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
sha256sums=('6a1d1dd59fa47f5115a8cae258e71f20d254218d50a70d9bcea6976ae2d5d9d2'
            '87207ee66a413fd4388a5f31a8443677d10148618f3a3048ee89b24b36a7d0e4')

check() {
    cd "$srcdir"
    sha256sum -c <(sed "s/fasthex-x86_64-linux-musl/fasthex-$pkgver/" "fasthex-$pkgver.sha256")
}

package() {
    cd "$srcdir"
    install -Dm755 "fasthex-$pkgver" "$pkgdir/usr/bin/fasthex"
}
