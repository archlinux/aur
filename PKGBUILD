# Maintainer: CallMeAlphabet
pkgname=fasthex-bin
pkgver=45
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
sha256sums=('4b97b76c3d4f1600f8a9b6ec623c698454e2b29d366b70ee94dcc9e8331b0167'
            '9782f4e3e0c8d06f86dbf680fc6126916d840756abcd400ee15ca87b1bac102a')

check() {
    cd "$srcdir"
    sha256sum -c <(sed "s/fasthex-x86_64-linux-musl/fasthex-$pkgver/" "fasthex-$pkgver.sha256")
}

package() {
    cd "$srcdir"
    install -Dm755 "fasthex-$pkgver" "$pkgdir/usr/bin/fasthex"
}
