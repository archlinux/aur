# Maintainer: Sergey Vlasov <sergey@vlasov.me>
pkgname=nulloy
pkgver=0.8
pkgrel=2
pkgdesc="Music Player with a Waveform Progress Bar"
arch=('i686' 'x86_64')
url="http://nulloy.com/"
license=('GPLv3')
depends=('qt4' 'gst-plugins-base' 'taglib')
source=("https://github.com/$pkgname/$pkgname/releases/download/$pkgver/${pkgname}-${pkgver}.tar.gz")
md5sums=('4b6851307b5271d2837e7bc99b46e45c')

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
