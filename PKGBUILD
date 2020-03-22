# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=pacfetch-bin
pkgver=0.1.2
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
sha512sums=('3cea8bb8480f9fca8ed90ba3ddfcbf74f7f60b073b747a4e47c730041d5b41ef39a8a8783c510bd9cdfc51173dc498e2d73a5347c8f27ecbf23480b13cbc9f8f')

arch=('x86_64')

package() {
    install -D "$srcdir/pacfetch-v$pkgver" "$pkgdir/usr/bin/pacfetch"
}
