# Maintainer: Michael Spencer <sonrisesoftware@gmail.com>

_pkgname=papyros-qmltermwidget
pkgname=$_pkgname-git
pkgrel=1
pkgver=0.1.0.r26.g031db29
pkgdesc='QML port of qtermwidget - Papyros development version'
arch=('i686' 'x86_64')
url='https://github.com/papyros/qmltermwidget'
license=('GPL')
depends=('qt5-declarative')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "qmltermwidget")
source=("$_pkgname::git://github.com/papyros/qmltermwidget.git")
sha256sums=('SKIP')

pkgver () {
    cd "$srcdir/$_pkgname"

    git describe --tags --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"

    qmake
    make
}

package() {
    cd "$srcdir/$_pkgname"

    make INSTALL_ROOT="$pkgdir" install
}
