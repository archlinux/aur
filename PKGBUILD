# Maintainer: CallMeAlphabet
pkgname=near-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="near, a LAN-only file transfer hub, prebuilt binary"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/near"
license=('Apache-2.0')
depends=('gcc-libs')
provides=('near')
conflicts=('near')
source=("near-$pkgver::https://github.com/CallMeAlphabet/near/releases/download/latest/near-x86_64-linux-musl"
        "near-$pkgver.sha256::https://github.com/CallMeAlphabet/near/releases/download/latest/near-x86_64-linux-musl.sha256")
sha256sums=('0c826f0061513d1f7722a22f2a3a28c43de1a78c07fde03773e1b8e140a6f7a4'
            '29adfd147bd49f5dfbbab351b2b287af71fca29edb605f4604af5bb89d878b2e')

check() {
    cd "$srcdir"
    sha256sum -c <(sed "s/near-x86_64-linux-musl/near-$pkgver/" "near-$pkgver.sha256")
}

package() {
    cd "$srcdir"
    install -Dm755 "near-$pkgver" "$pkgdir/usr/bin/near"
}
