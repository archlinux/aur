# Maintainer: CallMeAlphabet
pkgname=fastwc-bin
pkgver=40
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
sha256sums=('ec34e36c065b8a5d82ff23c2d7c81a1c85b2376b94d55957068d61e26dd4a905'
            'fe1ae8f5754e4b690c6ca8d2825329032c70f9ea2b2718cac87909743da1dcc9')

check() {
    cd "$srcdir"
    sha256sum -c <(sed "s/fastwc-x86_64-linux-musl/fastwc-$pkgver/" "fastwc-$pkgver.sha256")
}

package() {
    cd "$srcdir"
    install -Dm755 "fastwc-$pkgver" "$pkgdir/usr/bin/fastwc"
}
