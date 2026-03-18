pkgname=nf
_pkgname=ndpspoof
pkgver=0.0.5
pkgrel=1
pkgdesc="A tool to perform RA/RDNSS/NA spoofing"
arch=('any')
url=https://github.com/shadowy-pycoder/ndpspoof
license=('GPLv3')
depends=()
makedepends=('go' 'git')
source=("git+https://github.com/shadowy-pycoder/ndpspoof")

pkgver() {
    cd "$srcdir/$_pkgname"
    sed -n 's/.*v\([0-9.]*\)".*/\1/p' version.go
}

build() {
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 "./bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
sha256sums=('SKIP')
