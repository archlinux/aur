# Maintainer: kachelaqa <kachelaqa at gmail dot com>

pkgname='pkgbrowser'
pkgver=0.28
pkgrel=2
pkgdesc='A utility for browsing pacman databases and the AUR'
arch=('x86_64')
url="https://codeberg.org/kachelaqa/$pkgname"
license=('GPL2')
depends=('pacman>=4.1' 'pacman<6.1' 'python>=3.2' 'python<3.12' 'python-pyqt5')
install="$pkgname.install"
source=("https://codeberg.org/kachelaqa/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('0d10a01c6cc64ba0057f38e528c5778b')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX='/usr'
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX='/usr' DESTDIR="$pkgdir" install
}
