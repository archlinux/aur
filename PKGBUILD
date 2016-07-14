# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=qmapshack
pkgver=1.6.3
pkgrel=1
pkgdesc='Plan your next outdoor trip'
arch=('x86_64')
url='https://bitbucket.org/maproom/qmapshack/'
license=('GPL3')
depends=('gdal' 'routino>=3.1' 'qt5-tools' 'qt5-script')
makedepends=('cmake')
source=("https://bitbucket.org/maproom/qmapshack/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('6fa5158bd823e8d43eb8a4e4db35a05720d1fe8d624eb65320b905ae315bd708')

build() {
    cd "$pkgname-$pkgver"

    cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"

    make DESTDIR="${pkgdir}" install
}
