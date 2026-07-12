# Maintainer: vani-tty1 <giovannirafanan609@gmail.com>
pkgname=vlp
pkgver=0.1.0
pkgrel=1
pkgdesc="A cli tool that parses /var/log/pacman.log and shows installed packages, sync commands, and upgrades"
arch=('x86_64' 'aarch64')
url="https://github.com/vani-tty1/vlp"
license=('GPL3')
depends=('zlib')
makedepends=('meson' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vani-tty1/vlp/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('f2923744503de1e5d4999186b9dde506476152cbef5bbb9b453d66832c0e1b688c8d907aa065a4da7e99cecbba7cac720421d8c6f3ee383c1538a0c211c31646')

build() {
    arch-meson "$pkgname-$pkgver" build
    meson compile -C build
}

package() {
    meson install -C build --destdir="$pkgdir"
}
