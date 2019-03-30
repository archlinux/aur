# Maintainer: Nikita Bobko <nikitabobko (at) gmail (dot) com>

pkgname=xfce4-windowck-plugin-bobko-mod
pkgver=0.4.5
pkgrel=2
pkgdesc="Xfce panel plugin which allows to put the maximized window title and buttons on the panel. bobko mod"
arch=('i686' 'x86_64')
url="https://github.com/nikitabobko/xfce4-windowck-plugin-bobko-mod"
license=('GPL3')
groups=('xfce4')
depends=('xfce4-panel')
conflicts=("xfce4-windowck-plugin")
makedepends=('intltool' 'xfce4-dev-tools' 'python3' 'imagemagick')
options=('!libtool')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nikitabobko/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e7fe5f224cbe8555d2580c91fab62febc8c3859a01abeb30b6a506bf99f2ffaa')

build() {
    cd "$srcdir/${pkgname}-$pkgver"
    ./autogen.sh --prefix=/usr 
    make
}

package() {
    cd "$srcdir/${pkgname}-$pkgver"
    make DESTDIR="$pkgdir" install
}
