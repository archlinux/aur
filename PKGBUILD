# Maintainer:  twa022 <twa022 at gmil dot com>
# Contributor: Thanos Apostolou <thanosapostolou@outlook.com>
# Contributor: Cedric Leporcq <cedric at gmail dot com>

pkgname=xfce4-windowck-plugin
pkgver=0.4.6
pkgrel=2
pkgdesc="Xfce panel plugin which allows to put the maximized window title and buttons on the panel."
arch=('i686' 'x86_64')
url="https://github.com/cedl38/xfce4-windowck-plugin"
license=('GPL3')
depends=('xfce4-panel<4.15.0' 'libwnck')
makedepends=('intltool' 'xfce4-dev-tools' 'python' 'imagemagick')
options=('!libtool')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cedl38/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('1643fa4a8bdbc401160fae6a132dcab89ed88d10231f84ed058f7a3e842763f7')

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  ./autogen.sh --prefix=/usr 
  make
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  make DESTDIR="$pkgdir" install
}
