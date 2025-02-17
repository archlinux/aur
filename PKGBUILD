# Maintainer: 2IMT <contact.2imt@mail.ru>
pkgname="battery-notifier"
pkgver="1.1"
pkgrel=1
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
source=("git+$url#tag=v$pkgver")
noextract=()
sha256sums=('66656174bc3c6489db7878c2c62411f1d8b6b2686e731755e8a6e7133f69602e')
validpgpkeys=()

build() {
    cd  $pkgname
    MYCFLAGS=-O3 CC=gcc make
}

package() {
    cd $pkgname
    INSTALL_PREFIX=$pkgdir/usr make install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
