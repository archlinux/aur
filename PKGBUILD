# Maintainer: PBS <pbs3141 at gmail dot com>
pkgname=bootmap
pkgver=0.9.3
pkgrel=1
pkgdesc="Integrated EFI image generator and system snapshotter"
arch=('x86_64')
url="https://gitlab.com/pbs3141/$pkgname"
license=('GPL3')
depends=('gcc-libs' 'util-linux-libs' 'libpipeline' 'libinih' 'btrfs-progs' 'bash' 'perl' 'sbsigntools' 'systemd' 'systemd-ukify')
makedepends=('asciidoc')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8962a71dbb1444f8b6293c997d4f29ff7b552991ace3b290ba7a36ea70d713ae')
backup=('etc/bootmap.conf' 'etc/kernel/cmdline')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
