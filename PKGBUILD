# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=pacfetch-bin
pkgver=0.0.8
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
sha512sums=('dfdb5d16e917f6ff6308a6a02cf6159a50656d6b6a69ec189173c62500c45dd4aeb24a24072597121bef42498270f6efbc72145ab973888cfcb2a35b2d7798d5')

arch=('x86_64')

package() {
    install -D "$srcdir/pacfetch-v$pkgver" "$pkgdir/usr/bin/pacfetch"
}
