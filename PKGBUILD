pkgname=mshark
_pkgname=mshark
pkgver=0.0.28
pkgrel=1
pkgdesc="Simple packet capture tool"
arch=('any')
url=https://github.com/shadowy-pycoder/mshark
license=('MIT')
depends=()
makedepends=('go' 'git')
source=("git+https://github.com/shadowy-pycoder/mshark")

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
