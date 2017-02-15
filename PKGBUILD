# Maintainer: kirigaya <kirigaya@mkacg.com>
pkgname=deepin-screen-recorder
pkgver=0.1
pkgrel=1
pkgdesc="This is default screen recorder application for Deepin."
arch=('i686' 'x86_64')
url="https://github.com/manateelazycat/deepin-screen-recorder"
license=('GPL')
groups=()
depends=('xcb-util' 'xcb-util-image' 'qt5-base')
makedepends=('git' 'qt5-tools')
source=("git+https://github.com/manateelazycat/deepin-screen-recorder.git")
md5sums=('SKIP') #autofill using updpkgsums

build() {
    cd "$srcdir/$pkgname"
    qmake-qt5 QMAKE_CFLAGS_ISYSTEM= PREFIX=/usr
    make
}

package() {
    cd "$srcdir/$pkgname"
    make INSTALL_ROOT="${pkgdir}" install
}