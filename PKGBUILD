# Maintainer: kachelaqa <kachelaqa at gmail dot com>

pkgname='pkgbrowser'
pkgver=0.29.1
pkgrel=1
pkgdesc='A utility for browsing pacman databases and the AUR'
arch=('x86_64')
url="https://codeberg.org/kachelaqa/$pkgname"
license=('GPL2')
depends=('pacman>=4.1' 'pacman<7.2' 'python>=3.2' 'python<3.15' 'python-pyqt6')
makedepends=('python-setuptools')
source=("https://codeberg.org/kachelaqa/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('c1f50c8531442332809720cd09da61b0')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX='/usr'
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX='/usr' DESTDIR="$pkgdir" install
}
