# Maintainer: kachelaqa <kachelaqa at gmail dot com>

pkgname='pkgbrowser'
pkgver=0.29
pkgrel=1
pkgdesc='A utility for browsing pacman databases and the AUR'
arch=('x86_64')
url="https://codeberg.org/kachelaqa/$pkgname"
license=('GPL2')
depends=('pacman>=4.1' 'pacman<7.2' 'python>=3.2' 'python<3.15' 'python-pyqt6')
makedepends=('python-setuptools')
source=("https://codeberg.org/kachelaqa/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('fb9402a978d8f122ce593afe0a4a885d')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX='/usr'
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX='/usr' DESTDIR="$pkgdir" install
}
