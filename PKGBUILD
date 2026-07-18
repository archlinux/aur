# Maintainer: CallMeAlphabet
pkgname=fastwc-bin
pkgver=e85c885
pkgrel=1
pkgdesc="fastwc, a fast wc rewrite, prebuilt binary"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/fastwc"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('git')
provides=('fastwc')
conflicts=('fastwc')
source=("fastwc::https://github.com/CallMeAlphabet/fastwc/releases/download/latest/fastwc"
        "fastwc.sha256::https://github.com/CallMeAlphabet/fastwc/releases/download/latest/fastwc.sha256")
sha256sums=('SKIP' 'SKIP')

pkgver() {
    git ls-remote "https://github.com/CallMeAlphabet/fastwc.git" refs/tags/latest | cut -c1-7
}

check() {
    cd "$srcdir"
    sha256sum -c "fastwc.sha256"
}

package() {
    cd "$srcdir"
    install -Dm755 "fastwc" "$pkgdir/usr/bin/fastwc"
}
