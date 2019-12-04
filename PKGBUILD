# Maintainer: John Naylor <jonaylor89@gmail.com>
# Maintainer: Zephyr Headley <headleyjz@vcu.edu>

pkgname=jaz
pkgver=0.0.2
pkgrel=1
epoch=0
pkgdesc="Find secrets hidden in commits"
url="https://github.com/jonaylor89/JAZ"
license=("MIT")
install=""
changelog=""
source=(https://github.com/jonaylor89/JAZ/archive/v0.0.2.tar.gz)
validpgpkeys=()
noextract=()
md5sums=('a3536692737f87ae9b7a1046209a3fe4')
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

package() {
    cd ..
    usrdir="$pkgdir/usr"
    mkdir -p $usrdir
    cargo install --locked --path src/JAZ-0.0.2/ --root "$usrdir"
    rm -f $usrdir/.crates.toml
}
