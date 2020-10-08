# Maintainer: José Almeida <jose.afga@gmail.com>

pkgname=echowo
pkgver=0.2.0
pkgrel=2
pkgdesc="Bash echo like with string uwufication."
url="https://github.com/joseafga/echowo"
license=('MIT')
arch=('x86_64')
source=("$pkgname-$pkgver::https://github.com/joseafga/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b02f055c9c4d69d8c36127c00095aa0afc33735dd540c521e32dde8e021e74e5')
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
  install -Dm755 bin/echowo "${pkgdir}/usr/bin/echowo"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
