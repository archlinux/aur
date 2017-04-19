#Maintainer= Stefano Capitani <stefanoatmanjarodotorg>

pkgname=mate-indicator-applet
pkgver=1.18.0
pkgrel=4
pkgdesc="Applet to display information from various applications consistently in the MATE panel."
arch=('i686' 'x86_64')
url="https://github.com/mate-desktop/$pkgname"
license=('GPLv3')
makedepends=("intltool")
depends=("mate-panel" "libappindicator-gtk3" 'ido')
optdepends=('indicator-sound')
source=("https://pub.mate-desktop.org/releases/1.18/$pkgname-$pkgver.tar.xz")
sha256sums=('4fe04328f2d86a1f0817e320a0fb841f7eb5839d0ae5131b44a8413d49489829')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR=$pkgdir/ install
}
