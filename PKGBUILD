# Maintainer: José Almeida <jose.afga@gmail.com>

pkgname=echowo
pkgver=0.1.0
pkgrel=1
pkgdesc="Near-drop-in replacement for the Unix echo command which also uwu-fies text."
url="https://github.com/joseafga/echowo"
license=('MIT')
arch=('x86_64')
source=("$pkgname-$pkgver::https://github.com/joseafga/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d1f1ad7ffe7b50cfb328f451c981900e95531dc48bad3e673c517706a0b80413')
makedepends=('crystal')

provides=('echowo')
conflicts=('echowo')

build() {
  cd $pkgname-$pkgver
  
  crystal build "echowo.cr" -o "bin/echowo" --release
}

package() {
  cd $pkgname-$pkgver
  
  # install files
  install -Dm644 bin/echowo "${pkgdir}/usr/bin/echowo"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
