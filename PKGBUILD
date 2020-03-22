# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=pacfetch-bin
pkgver=0.0.10
pkgrel=1
pkgdesc="Simple fetch script for pacman based distros. Written in Rust."
url="https://git.auteiy.me/dmitry/pacFetch"
license=('GPL3')
provides=('pacfetch')
conflicts=('pacfetch-git')
depends=(
    gcc-libs
)

source=("pacfetch-v$pkgver::https://github.com/auteiy/pacfetch/releases/download/v$pkgver/pacfetch-v$pkgver-linux-x64")

# Checksums automatically set in CI, see: /.gitlab-ci.yml
sha512sums=('b31eb18de109a0572b6a3e2aae4e5aa05e73d44c272fe9dde1c1d949b1d6bd0c1b35055b0f646133c0d3fe9052422b1bb88f0c35b7dd5231336b29e6484b88ce')

arch=('x86_64')

package() {
    install -D "$srcdir/pacfetch-v$pkgver" "$pkgdir/usr/bin/pacfetch"
}
