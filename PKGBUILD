# Maintainer: CallMeAlphabet
pkgname=fastwc-bin
pkgver=32
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
sha256sums=('b83a8b17541f56dd4fc048e3b67d168e23b729f90df7068b732ee267c0649f6e'
            '9d537f8a6416769311960a8132da8cb5ee59a6d593bdcc3d30613e52e415ad33')

check() {
    cd "$srcdir"
    sha256sum -c <(sed "s/fastwc-x86_64-linux-musl/fastwc-$pkgver/" "fastwc-$pkgver.sha256")
}

package() {
    cd "$srcdir"
    install -Dm755 "fastwc-$pkgver" "$pkgdir/usr/bin/fastwc"
}
