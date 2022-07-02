# Maintainer: z3oxs <z3ox1s@protonmail.com>
pkgname=dl
pkgver=1.0.2.1
pkgrel=1
pkgdesc="A tool and core to download videos from your terminal"
arch=(x86_64 i686)
url="https://github.com/z3oxs/dl.git"
license=('MIT')
depends=(go)
makedepends=(git go)
provides=(dl)
conflicts=(dl)
source=("git+$url")
md5sums=('SKIP')
sha256sums=('SKIP')

build() {
    cd "$srcdir/dl/cli/"
    go build -o "dl"
}

package() {
    cd "$srcdir/dl"
    install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cd "cli/"
    install -Dm755 dl "${pkgdir}/usr/bin/dl"
}
