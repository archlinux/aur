# Maintainer: kachelaqa <kachelaqa at gmail dot com>

pkgname='pkgbrowser'
pkgver=0.27
pkgrel=1
pkgdesc='A utility for browsing pacman databases and the AUR'
arch=('x86_64')
url="https://osdn.net/projects/$pkgname"
license=('GPL2')
depends=('pacman>=4.1' 'pacman<6.1' 'python>=3.2' 'python<3.11' 'python-pyqt5')
install="$pkgname.install"
source=("https://osdn.net/dl/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('59bbd43e6a058d84374ee4fadd387bda')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX='/usr'
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX='/usr' DESTDIR="$pkgdir" install
}
