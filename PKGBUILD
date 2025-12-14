# Maintainer: kachelaqa <kachelaqa at gmail dot com>

pkgname='pkgbrowser'
pkgver=0.28.1
pkgrel=5
pkgdesc='A utility for browsing pacman databases and the AUR'
arch=('x86_64')
url="https://codeberg.org/kachelaqa/$pkgname"
license=('GPL2')
depends=('pacman>=4.1' 'pacman<7.2' 'python>=3.2' 'python<3.14' 'python-pyqt5')
makedepends=('python-setuptools')
install="$pkgname.install"
source=("https://codeberg.org/kachelaqa/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('122c2dcecf5492723bb64b5f13233d50')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX='/usr'
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX='/usr' DESTDIR="$pkgdir" install
}
