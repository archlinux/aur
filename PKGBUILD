# Maintainer: Henil <dedaniahenil@gmail.com>
pkgname=mosaic-git
_pkgname=mosaic
pkgver=0.0
pkgrel=0
epoch=
pkgdesc="Terminal Workspace (WIP)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://www.github.com/mosaic-org/mosaic"
license=('MIT')
groups=()
depends=()
makedepends=('rust' 'cargo' 'git')
checkdepends=()
optdepends=()
provides=('mosaic')
conflicts=('mosaic')
options=()
source=("git+https://github.com/mosaic-org/mosaic")
sha256sums=(SKIP)

build() {
    cd "$srcdir/$_pkgname"
    cargo build --locked --release --target-dir target
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 target/release/mosaic "${pkgdir}/usr/bin/mosaic"
}
