# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=pacfetch-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Simple fetch script for pacman based distros. Written in Rust."
url="https://git.auteiy.me/dmitry/pacFetch"
license=('GPL3')
provides=('pacfetch')
conflicts=('pacfetch-git')
depends=(
    gcc-libs
    wmctrl
)

source=("pacfetch-v$pkgver::https://github.com/auteiy/pacfetch/releases/download/v$pkgver/pacfetch-v$pkgver-linux-x64")

# Checksums automatically set in CI, see: /.gitlab-ci.yml
sha512sums=('7f9ae482ea851fa344d1b6ce0ace443c23a54f964057d4a30aebb310b2be31b3ab4aace970430de06b3a20d7ff0d56120b721979419a99422429d6cfd3963265')

arch=('x86_64')

package() {
    install -D "$srcdir/pacfetch-v$pkgver" "$pkgdir/usr/bin/pacfetch"
}
