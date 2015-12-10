# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=qmapshack
pkgver=1.4.0
pkgrel=2
pkgdesc='Plan your next outdoor trip'
arch=('x86_64')
url='https://bitbucket.org/maproom/qmapshack/'
license=('GPL3')
depends=('gdal' 'routino-svn' 'qt5-tools' 'qt5-script')
makedepends=('cmake' 'make')
source=("https://bitbucket.org/maproom/qmapshack/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('760ff0969a5b517ba0b827b3e150e3088e1f45a0ffa4408f2e0f1c93b2895228')

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
