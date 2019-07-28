# Maintainer: (vmp) Roland Suchan <snrd at arcor dot de>

pkgname=qtrans
pkgver=0.3.2.6
pkgrel=1
pkgdesc='Word translator (offline dictionary frontend)'
arch=('x86_64')
url='https://www.opendesktop.org/s/Apps/p/1127419/'
license=('GPL')
depends=('qt5-webkit' 'kxmlgui' 'hicolor-icon-theme')
#optdepends=('')
makedepends=('git')
source=("https://liquidtelecom.dl.sourceforge.net/project/qtrans0/kf5/0.3.2.6/qtrans-0.3.2.6.tar.gz")
sha256sums=('1f07792866f794c868aee4c2f75608a09303b9c630f547ad0c32c565bacf5c61')

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
