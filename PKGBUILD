# Maintainer: John Naylor <jonaylor89@gmail.com>
# Maintainer: Zephyr Headley <headleyjz@vcu.edu>

pkgname=jaz
pkgver=untagged.bb6c30731c22f278cf49.r0.g19fb239
pkgrel=1
epoch=0
pkgdesc="Find secrets hidden in commits"
url="https://github.com/jonaylor89/JAZ"
license=("MIT")
install=""
changelog=""
source=()
validpgpkeys=()
noextract=()
md5sums=()
sha1sums=()
sha256sums=()
sha384sums=()
sha512sums=()
groups=()
arch=("x86_64")
backup=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
conflicts=()
provides=()
replaces=()
options=()

pkgver() {
    (git describe --long --tags || echo "$pkgver") | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cargo build --release
}

package() {
    cd ..
    usrdir="$pkgdir/usr"
    mkdir -p $usrdir
    cargo install --path . --root "$usrdir"
    rm -f $usrdir/.crates.toml
}
