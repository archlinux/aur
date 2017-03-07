# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Akira Ohgaki <akiraohgaki@gmail.com>

pkgname='ocs-url'
pkgver='3.0.0'
pkgrel='1'
pkgdesc='An install helper program for items served on OpenCollaborationServices (OCS). replacing xdgurl'
arch=('i686' 'x86_64')
url="https://github.com/$pkgname/$pkgname"
license=('GPL3')
depends=('qt5-base>=5.2.0' 'qt5-svg>=5.2.0' 'qt5-declarative>=5.2.0' 'qt5-quickcontrols>=5.2.0')
makedepends=('git')
conflicts=('xdgurl')
provides=('xdgurl')
replaces=('xdgurl')
source=("$url/archive/release-$pkgver.tar.gz")
md5sums=('696d3109673f55e027555799f5b54097')

prepare() {
    cd $pkgname-release-$pkgver
    sh scripts/import.sh
}

build() {
    cd $pkgname-release-$pkgver
    qmake PREFIX="/usr"
    make
}

package() {
    cd $pkgname-release-$pkgver
    make INSTALL_ROOT=$pkgdir install
}
