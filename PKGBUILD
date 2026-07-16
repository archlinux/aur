# Maintainer: vani-tty1 <giovannirafanan609@gmail.com>
pkgname=vlp
pkgver=0.1.2
pkgrel=1
pkgdesc="A cli tool that parses /var/log/pacman.log and shows installed packages, sync commands, and upgrades"
arch=('x86_64' 'aarch64')
url="https://github.com/vani-tty1/vlp"
license=('GPL3')
depends=('zlib')
makedepends=('meson' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vani-tty1/vlp/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('c50f2a7b21651a3e4aafe20ae4e60b84781b025bb7c6d0f58294d5ae440a6712b57cbd8cf7786358c31a3ea0b109f6ac25630e25b1f5105534d463f0e991d6cc')

build() {
    arch-meson "$pkgname-$pkgver" build
    meson compile -C build
}

package() {
    meson install -C build --destdir="$pkgdir"
}
