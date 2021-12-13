# Maintainer: kachelaqa <kachelaqa at gmail dot com>

pkgname='pkgbrowser'
pkgver=0.25
pkgrel=2
pkgdesc='A utility for browsing pacman databases and the AUR'
arch=('x86_64')
url="https://osdn.net/projects/$pkgname"
license=('GPL2')
depends=('pacman>=4.1' 'pacman<6.1' 'python>=3.2' 'python<3.11' 'python-pyqt5')
install="$pkgname.install"
source=("https://osdn.net/dl/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('2fce9a98e6e18f346fb4ad932534cd38')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX='/usr'
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX='/usr' DESTDIR="$pkgdir" install
}
