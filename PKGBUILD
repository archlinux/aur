# Maintainer: kachelaqa <kachelaqa at gmail dot com>

pkgname='pkgbrowser'
pkgver=0.22
pkgrel=1
pkgdesc='A utility for browsing pacman databases and the AUR'
arch=('x86_64')
url="https://bitbucket.org/kachelaqa/$pkgname"
license=('GPL2')
depends=('pacman>=4.1' 'pacman<5.3' 'python>=3.2' 'python<3.8' 'python-pyqt5')
install="$pkgname.install"
source=("$url/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('0ace358c14cbb4cb052b6abd04774979')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX='/usr'
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX='/usr' DESTDIR="$pkgdir" install
}
