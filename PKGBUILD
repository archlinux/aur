# Contributor: Emanuele Rossi <newdna1510@yahoo.it>
# Maintainer: (vmp) Roland Suchan <snrd at arcor dot de>

pkgname=qtrans
pkgver=0.3.2.7
pkgrel=2
pkgdesc='QTrans is a word translator for Qt5/KF5. It uses Babylon (*.dic) dictionaries and translates many languages.'
arch=('i686' 'x86_64')
#url='https://www.opendesktop.org/s/Apps/p/1127419/'
url="https://www.linux-apps.com/p/1127419/"
license=('GPL')
depends=('qt5-base' 'kconfig5' 'ki18n5' 'ktextwidgets5' 'qt5-webkit' 'kcoreaddons5' 'python' 'kxmlgui5' 'kwidgetsaddons5' 'zlib' 'hicolor-icon-theme' 'extra-cmake-modules')
#depends=('qt5-webkit' 'kxmlgui' 'hicolor-icon-theme')
#optdepends=('')
makedepends=('git')
source=("https://sourceforge.net/projects/qtrans0/files/kf5/0.3.2.7/qtrans-0.3.2.7.tar.gz")
sha256sums=('5a19be0354752ced0abe4ee2449db2d3a669c3227343fbbcf479a3a21edda362')

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
