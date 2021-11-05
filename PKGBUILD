# Maintainer: Juanjo Gutierrez <juanjo at gutierrezdequevedo dot com>
pkgname=picsimlab
pkgver=0.8.9
pkgrel=1
pkgdesc="Programmable IC Simulator Laboratory"
arch=('x86_64' 'aarch64')
url="https://github.com/lcgamboa/picsimlab"
license=('GPL2')
conflicts=('picsimlab-bin')
depends=('lxrad' 'simavr-picsimlab')
optdepends=('cutecom' 'tty0tty')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9249bf1f3a37afed25fb16eb9f43a9bb61a32ba4bfd9ce939469d7d91befa704')


build() {
    cd "$pkgname-$pkgver"
    make CXXFLAGS="-std=c++11"
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" PREFIX="/usr" install_app
    cd "src"
    make DESTDIR="$pkgdir/" PREFIX="/usr" install_docs
}
