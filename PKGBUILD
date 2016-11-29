# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Akira Ohgaki <akiraohgaki@gmail.com>

pkgname=xdgurl
pkgver=2.0.2
pkgrel=1
pkgdesc='An install helper program for desktop stuff.'
arch=('i686' 'x86_64')
url="https://github.com/$pkgname/$pkgname"
license=('GPL3')
depends=('qt5-base>=5.3.0'
        'qt5-declarative>=5.3.0'
        'qt5-quickcontrols>=5.3.0'
        'qt5-svg>=5.3.0')
source=("$url/archive/release-$pkgver.tar.gz")
md5sums=('8100db8a612df65b766d08b3996defd3')

build() {
    cd "$pkgname-release-$pkgver"
    qmake PREFIX='/usr'
    make
}

package() {
    cd "$pkgname-release-$pkgver"
    make INSTALL_ROOT="$pkgdir" install
}
