# Maintainer: kachelaqa <kachelaqa at gmail dot com>

pkgname='pkgbrowser'
pkgver=0.24
pkgrel=1
pkgdesc='A utility for browsing pacman databases and the AUR'
arch=('x86_64')
url="https://osdn.net/projects/$pkgname"
license=('GPL2')
depends=('pacman>=4.1' 'pacman<5.3' 'python>=3.2' 'python<3.10' 'python-pyqt5')
install="$pkgname.install"
source=("https://osdn.net/dl/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('f4d8c86a58f7245d357797bf8694fa71')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX='/usr'
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX='/usr' DESTDIR="$pkgdir" install
}
