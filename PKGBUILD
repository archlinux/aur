# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Akira Ohgaki <akiraohgaki@gmail.com>

pkgname=ocs-url
pkgver=3.0.3
pkgrel=1
pkgdesc='An install helper program for items served on OpenCollaborationServices (OCS). replacing xdgurl'
arch=('x86_64')
url="https://github.com/opendesktop/$pkgname"
license=('GPL3')
depends=('qt5-base>=5.2.0' 'qt5-svg>=5.2.0' 'qt5-declarative>=5.2.0' 'qt5-quickcontrols>=5.2.0')
conflicts=('xdgurl')
provides=('xdgurl')
source=("$url/archive/release-$pkgver.tar.gz")
md5sums=('2efb70de17e6ab87188e836edd49dc53')

prepare() {
    cd $pkgname-release-$pkgver
    sh scripts/prepare.sh
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
