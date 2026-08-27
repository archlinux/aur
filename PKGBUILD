# Maintainer: CallMeAlphabet
pkgname=fastmc-bin
pkgver=15
pkgrel=1
pkgdesc="fastmc, create a Minecraft server in under a minute, prebuilt binary"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/fastmc"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
provides=('fastmc')
conflicts=('fastmc')
source=("fastmc-$pkgver::https://github.com/CallMeAlphabet/fastmc/releases/download/latest/fastmc-x86_64-linux-musl"
        "fastmc-$pkgver.sha256::https://github.com/CallMeAlphabet/fastmc/releases/download/latest/fastmc-x86_64-linux-musl.sha256")
sha256sums=('SKIP' 'SKIP')

check() {
    cd "$srcdir"
    sha256sum -c <(sed "s/fastmc-x86_64-linux-musl/fastmc-$pkgver/" "fastmc-$pkgver.sha256")
}

package() {
    cd "$srcdir"
    install -Dm755 "fastmc-$pkgver" "$pkgdir/usr/bin/fastmc"
}
