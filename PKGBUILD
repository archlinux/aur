# Maintainer: vani-tty1 <giovannirafanan609@gmail.com>
pkgname=vlp
pkgver=0.1.1
pkgrel=1
pkgdesc="A cli tool that parses /var/log/pacman.log and shows installed packages, sync commands, and upgrades"
arch=('x86_64' 'aarch64')
url="https://github.com/vani-tty1/vlp"
license=('GPL3')
depends=('zlib')
makedepends=('meson' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vani-tty1/vlp/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('ae983db65ee86ff109026ba35eefd8b0c12fe126922f41d7d003ee7d3402c8df2bdbf375ec634ccf7b101bb7042b0f4eaca45e4033ceeea15acdf23ef1bdfda8')

build() {
    arch-meson "$pkgname-$pkgver" build
    meson compile -C build
}

package() {
    meson install -C build --destdir="$pkgdir"
}
