# Contributor: Emanuele Rossi <newdna1510@yahoo.it>
# Maintainer: (vmp) Roland Suchan <snrd at arcor dot de>

pkgname=qtrans
pkgver=0.4
pkgrel=1
pkgdesc='QTrans is a word translator for Qt6/KF6. It uses Babylon (*.dic) dictionaries and translates many languages.'
arch=('i686' 'x86_64')
#url='https://www.opendesktop.org/s/Apps/p/1127419/'
url="https://www.linux-apps.com/p/1127419/"
license=('GPL')
depends=('qt6-base' 'kconfig' 'ki18n5' 'ktextwidgets' 'qt6-webengine' 'kcoreaddons' 'python' 'kxmlgui' 'kwidgetsaddons' 'zlib' 'hicolor-icon-theme' 'extra-cmake-modules')
#depends=('qt5-webkit' 'kxmlgui' 'hicolor-icon-theme')
#optdepends=('')
makedepends=('git')
source=("https://sourceforge.net/projects/qtrans0/files/kf6/0.4/qtrans-0.4.tar.gz")
sha256sums=('da1c4f3ac73fec6105f15a56f4fdc9eef60a667514959bb524aa531c5988ab25')

prepare() {
    mkdir -p build
    }
    
build() {
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release ../$pkgname-$pkgver
    make
    }

package() {
    cd build
    make DESTDIR=${pkgdir} install
}
