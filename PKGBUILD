# Maintainer: Sergey Vlasov <sergey@vlasov.me>
pkgname=nulloy
pkgver=0.8.1
pkgrel=3
pkgdesc="Music Player with a Waveform Progress Bar"
arch=('i686' 'x86_64')
url="http://nulloy.com/"
license=('GPLv3')
depends=('qt4' 'gst-plugins-base' 'taglib')
source=("https://github.com/$pkgname/$pkgname/releases/download/$pkgver/${pkgname}-${pkgver}.tar.gz")
md5sums=('7a3c1ec1473b52c311edd57aa0ab0c36')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export QMAKE=/usr/bin/qmake-qt4
  export LRELEASE=/usr/bin/lrelease-qt4

  ./configure --prefix=/usr --taglib --no-update-check
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
}
