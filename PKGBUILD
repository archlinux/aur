# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=pacfetch-bin
pkgver=0.0.5
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
sha512sums=('198c876d4fe5f586d232069c4bb2088b94d4f71131276a22aeaa768d13b2cf0512aa67e15e4d42f94b5be13b0018cc66369ce626e13cc737af1dc3525fb46837')

arch=('x86_64')

package() {
    install -D "$srcdir/pacfetch-v$pkgver" "$pkgdir/usr/bin/pacfetch"
}
