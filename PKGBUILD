# Maintainer: kachelaqa <kachelaqa at gmail dot com>

pkgname='pkgbrowser'
pkgver=0.20.1
pkgrel=1
pkgdesc='A utility for browsing pacman databases and the AUR'
arch=('i686' 'x86_64')
url="https://bitbucket.org/kachelaqa/$pkgname"
license=('GPL2')
depends=('pacman>=4.1' 'pacman<5.1' 'python>=3.2' 'python<3.7' 'python-pyqt5')
install="$pkgname.install"
source=("$url/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('2dc44c7ef8307866bc814ba5dc55e955')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX='/usr'
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX='/usr' DESTDIR="$pkgdir" install
}
