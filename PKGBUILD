# Maintainer: Jean Pierre Cimalando <jp-dev@inbox.ru>
pkgname=qrest
_pkgname=Qrest
pkgver=0.5.3
pkgrel=1
epoch=
pkgdesc="Musician toolkit to guess tempo & get delay & LFO times for common note durations"
arch=('x86_64')
url="https://github.com/deufrai/Qrest"
license=('GPL3')
groups=()
depends=('qt5-base')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/deufrai/Qrest/archive/v$pkgver.tar.gz"
        'qrest.desktop')
sha256sums=('d55bbb1f3380ec021fe22d51749e2d4b5ed21078a9074c8d6e7027230dbe0334'
            '8157b94715a09d4e70a2385cd620be107b89bbcd27931682c3ac81b3f5076a4c')
noextract=()
validpgpkeys=()

build() {
  cd "$_pkgname-$pkgver"
  qmake qrest.pro
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
  install -D -m644 "resources/pix/qresticon.png" "$pkgdir/usr/share/pixmaps/qrest.png"
  install -D -m644 "$srcdir/qrest.desktop" "$pkgdir/usr/share/applications/qrest.desktop"
}
