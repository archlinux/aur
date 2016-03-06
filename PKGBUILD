# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=qmapshack
pkgver=1.6.0
pkgrel=2
pkgdesc='Plan your next outdoor trip'
arch=('x86_64')
url='https://bitbucket.org/maproom/qmapshack/'
license=('GPL3')
depends=('gdal' 'routino>=3.1' 'qt5-tools' 'qt5-script')
makedepends=('cmake' 'make')
source=("https://bitbucket.org/maproom/qmapshack/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('e9e796c8f67c07e383a1400d039af196dfa52ba4398402fa96e08dbf78eb2768')

build() {
    cd "$pkgname-$pkgver"

    cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"

    make DESTDIR="${pkgdir}" install
}

post_install() {
    update-desktop-database -q
}


post_remove() {
    update-desktop-database -q
}
