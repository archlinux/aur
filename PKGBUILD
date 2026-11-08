# Maintainer: CallMeAlphabet
pkgname=near-bin
pkgver=0.1.0
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
sha256sums=('a89c418cc49464afd2992d121904dfba69087736def657f881fc39719df25460'
            'aff272046990d8d1e71715a3b3108615009b2797f68e036059d225275e8a7446')

check() {
    cd "$srcdir"
    sha256sum -c <(sed "s/near-x86_64-linux-musl/near-$pkgver/" "near-$pkgver.sha256")
}

package() {
    cd "$srcdir"
    install -Dm755 "near-$pkgver" "$pkgdir/usr/bin/near"
}
