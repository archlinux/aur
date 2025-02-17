# Maintainer: 2IMT <contact.2imt@mail.ru>
pkgname="battery-notifier"
pkgver="1.1"
pkgrel=2
epoch=
pkgdesc="CLI tool that notifies you when your battery is low"
arch=("x86_64")
url="https://github.com/2IMT/battery-notifier"
license=("MIT")
groups=()
depends=("glibc" "gcc-libs")
makedepends=("make" "gcc")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/2IMT/battery-notifier/archive/refs/tags/v1.1.tar.gz")
noextract=()
sha256sums=('1ca4207bb78ec806031a97b3f93b30a2f8c82759e3fdce442c3b9a777b35f94f')
validpgpkeys=()

build() {
    cd  $pkgname-$pkgver
    MYCFLAGS=-O3 CC=gcc make
}

package() {
    cd $pkgname-$pkgver
    INSTALL_PREFIX=$pkgdir/usr make install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
