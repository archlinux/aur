# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname='qmapshack-hg'
pkgver=r2393.ed1a61d9786d
pkgrel=1
pkgdesc='Plan your next outdoor trip'
arch=('x86_64')
url='https://bitbucket.org/maproom/qmapshack/'
license=('GPL3')
depends=('gdal' 'routino>=3.1' 'qt5-tools' 'qt5-script')
makedepends=('cmake' 'mercurial')
conflicts=('qmapshack')
provides=('qmapshack')
source=("$pkgname::hg+https://bitbucket.org/maproom/qmapshack")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"

    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
    cd "$pkgname"

    cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$pkgname"

    make DESTDIR="${pkgdir}" install
}
