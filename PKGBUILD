# Maintainer: Thanos Apostolou <thanosapostolou@outlook.com>
# Maintainer: Cedric Leporcq <cedric at gmail dot com>

pkgname=xfce4-windowck-plugin
pkgver=0.4.5
pkgrel=1
pkgdesc="Xfce panel plugin which allows to put the maximized window title and buttons on the panel."
arch=('i686' 'x86_64')
url="https://github.com/cedl38/xfce4-windowck-plugin"
license=('GPL3')
groups=('xfce4')
depends=('xfce4-panel')
makedepends=('intltool' 'xfce4-dev-tools' 'python3' 'imagemagick')
options=('!libtool')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cedl38/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('7c20e2af27e6f0406dd0598c0282a9ed73c5e83a178f7f79bb577482f4b5b091')

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  ./autogen.sh --prefix=/usr 
  make
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  make DESTDIR="$pkgdir" install
}
