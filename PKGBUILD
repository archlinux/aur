# Maintainer: CallMeAlphabet
pkgname=fastmc-bin
pkgver=359c3cf
pkgrel=1
pkgdesc="fastmc, create a Minecraft server in under a minute, prebuilt binary"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/fastmc"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('git')
provides=('fastmc')
conflicts=('fastmc')
source=("fastmc::https://github.com/CallMeAlphabet/fastmc/releases/download/latest/fastmc"
        "fastmc.sha256::https://github.com/CallMeAlphabet/fastmc/releases/download/latest/fastmc.sha256")
sha256sums=('SKIP' 'SKIP')

pkgver() {
    git ls-remote "https://github.com/CallMeAlphabet/fastmc.git" refs/tags/latest | cut -c1-7
}

check() {
    cd "$srcdir"
    sha256sum -c "fastmc.sha256"
}

package() {
    cd "$srcdir"
    install -Dm755 "fastmc" "$pkgdir/usr/bin/fastmc"
}
