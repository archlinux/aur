# Maintainer: CallMeAlphabet
pkgname=fastwc-bin
pkgver=39
pkgrel=1
pkgdesc="fastwc, a fast wc rewrite, prebuilt binary"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/fastwc"
license=('Apache-2.0')
depends=('gcc-libs')
provides=('fastwc')
conflicts=('fastwc')
source=("fastwc-$pkgver::https://github.com/CallMeAlphabet/fastwc/releases/download/latest/fastwc-x86_64-linux-musl"
        "fastwc-$pkgver.sha256::https://github.com/CallMeAlphabet/fastwc/releases/download/latest/fastwc-x86_64-linux-musl.sha256")
sha256sums=('dde1fbaceb8700c6f4ccf819e6413f2b806561ea754bb9bee07fbf51520df207'
            '402a86ba835d76ee060c1fb3dd2f43e8f53a8b809a510248e95046c1f06c2152')

check() {
    cd "$srcdir"
    sha256sum -c <(sed "s/fastwc-x86_64-linux-musl/fastwc-$pkgver/" "fastwc-$pkgver.sha256")
}

package() {
    cd "$srcdir"
    install -Dm755 "fastwc-$pkgver" "$pkgdir/usr/bin/fastwc"
}
