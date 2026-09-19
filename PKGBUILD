# Maintainer: CallMeAlphabet
pkgname=fastwc-bin
pkgver=37
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
sha256sums=('4db96ceb86c99ba921beb9ffc878e2ad6331a2a5fee1bdf9f4be22c2229857f1'
            '81009dcdc30641f0abc10938775cce799c1f20b611e00a66c834d4f78138e4fb')

check() {
    cd "$srcdir"
    sha256sum -c <(sed "s/fastwc-x86_64-linux-musl/fastwc-$pkgver/" "fastwc-$pkgver.sha256")
}

package() {
    cd "$srcdir"
    install -Dm755 "fastwc-$pkgver" "$pkgdir/usr/bin/fastwc"
}
