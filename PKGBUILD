# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Akira Ohgaki <akiraohgaki@gmail.com>

pkgname=ocs-url
pkgver=3.1.0
pkgrel=1
pkgdesc='An install helper program for items served via OpenCollaborationServices (ocs://).'
arch=('x86_64')
url="https://www.opencode.net/OCS/$pkgname"
license=('GPL3')
depends=('qt5-base>=5.2.0' 'qt5-svg>=5.2.0' 'qt5-declarative>=5.2.0' 'qt5-quickcontrols>=5.2.0')
conflicts=('xdgurl')
provides=('xdgurl')
source=("https://github.com/opendesktop/ocs-url/archive/release-$pkgver.tar.gz")
md5sums=('695117ee203f72208ba6c2cab60cbde6')

prepare() {
    cd $pkgname-release-$pkgver
    ./scripts/prepare
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
