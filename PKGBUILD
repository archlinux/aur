# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Akira Ohgaki <akiraohgaki@gmail.com>

pkgname=ocs-url
pkgver=3.0.2+56c32a9
pkgrel=1
_commit=56c32a954fb01da6fa767484ab07b9da633d0015
pkgdesc='An install helper program for items served on OpenCollaborationServices (OCS). replacing xdgurl'
arch=('x86_64')
url="https://github.com/$pkgname/$pkgname"
license=('GPL3')
depends=('qt5-base>=5.2.0' 'qt5-svg>=5.2.0' 'qt5-declarative>=5.2.0' 'qt5-quickcontrols>=5.2.0')
conflicts=('xdgurl')
provides=('xdgurl')
source=("$pkgname-$_commit::$url/archive/$_commit.tar.gz")
md5sums=('d99d31a70fb729c137e53f282bbfd64a')

prepare() {
    cd $pkgname-$_commit
    sh scripts/prepare.sh
}

build() {
    cd $pkgname-$_commit
    qmake PREFIX="/usr"
    make
}

package() {
    cd $pkgname-$_commit
    make INSTALL_ROOT="${pkgdir}" install
}
