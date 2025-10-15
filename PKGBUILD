# Maintainer: Charles Dong <chardon_cs@proton.me>

pkgname=downjack
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="Set up your gitignore and license files like using a lumberjack"
arch=("x86_64" "aarch64")
url="https://github.com/chardoncs/downjack"
license=('MIT')
groups=()
depends=("git")
makedepends=("go")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "https://github.com/chardoncs/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
noextract=()
sha256sums=('aebdcb73e3b5044c52b262a1db5f66525a5be95bcf57f36f8e5aa1d9076a4d48')
validpgpkeys=()

build() {
    cd $srcdir/${pkgname}-${pkgver}
    go build
}

check() {
    cd $srcdir/${pkgname}-${pkgver}
    go test ./...
}

package() {
    mkdir -p $pkgdir/usr/bin
    install -Dm755 -t $pkgdir/usr/bin $srcdir/${pkgname}-${pkgver}/${pkgname}
}
