# Maintainer: kachelaqa <kachelaqa at gmail dot com>

pkgname='pkgbrowser'
pkgver=0.23
pkgrel=1
pkgdesc='A utility for browsing pacman databases and the AUR'
arch=('x86_64')
url="https://osdn.net/projects/$pkgname"
license=('GPL2')
depends=('pacman>=4.1' 'pacman<5.3' 'python>=3.2' 'python<3.9' 'python-pyqt5')
install="$pkgname.install"
source=("https://osdn.net/dl/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('b43c7dfa527f62a2d15a3101b5416493')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX='/usr'
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX='/usr' DESTDIR="$pkgdir" install
}
