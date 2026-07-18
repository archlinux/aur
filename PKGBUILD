# Maintainer: CallMeAlphabet
pkgname=fasthex-bin
pkgver=42ebd65
pkgrel=1
pkgdesc="fasthex, a very fast hex dumper, prebuilt binary"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/fasthex"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('git')
provides=('fasthex')
conflicts=('fasthex')
source=("fasthex::https://github.com/CallMeAlphabet/fasthex/releases/download/latest/fasthex"
        "fasthex.sha256::https://github.com/CallMeAlphabet/fasthex/releases/download/latest/fasthex.sha256")
sha256sums=('SKIP' 'SKIP')

pkgver() {
    git ls-remote "https://github.com/CallMeAlphabet/fasthex.git" refs/tags/latest | cut -c1-7
}

check() {
    cd "$srcdir"
    sha256sum -c "fasthex.sha256"
}

package() {
    cd "$srcdir"
    install -Dm755 "fasthex" "$pkgdir/usr/bin/fasthex"
}
