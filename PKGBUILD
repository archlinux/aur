# Maintainer: CallMeAlphabet
pkgname=fastmc-bin
pkgver=17
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
sha256sums=('3cab6b294e2f5fb2f5febf51a1b408dfd3a55226f3973ad40f9cc8e28ff73adc'
            'af3dc6e43ab1252b56bf1b257033f57c88eda89f69c84870f881d8eebe361f07')

check() {
    cd "$srcdir"
    sha256sum -c <(sed "s/fastmc-x86_64-linux-musl/fastmc-$pkgver/" "fastmc-$pkgver.sha256")
}

package() {
    cd "$srcdir"
    install -Dm755 "fastmc-$pkgver" "$pkgdir/usr/bin/fastmc"
}
