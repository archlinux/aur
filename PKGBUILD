# Maintainer: CallMeAlphabet
pkgname=timeit-bin
pkgver=106fde4
pkgrel=1
pkgdesc="A precise command timing utility (x86_64 Linux only) — prebuilt binary from latest tested CI build"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/timeit"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('git')
provides=('timeit')
conflicts=('timeit')
source=("timeit::https://github.com/CallMeAlphabet/timeit/releases/download/latest/timeit"
        "timeit.sha256::https://github.com/CallMeAlphabet/timeit/releases/download/latest/timeit.sha256")
sha256sums=('SKIP' 'SKIP')

pkgver() {
    git ls-remote "https://github.com/CallMeAlphabet/timeit.git" refs/tags/latest | cut -c1-7
}

check() {
    cd "$srcdir"
    sha256sum -c "timeit.sha256"
}

package() {
    cd "$srcdir"
    install -Dm755 "timeit" "$pkgdir/usr/bin/timeit"
}
