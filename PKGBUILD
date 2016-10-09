pkgname=moka-icon-theme
pkgver=5.3.5
pkgrel=1
pkgdesc="A stylized Linux desktop icon set, designed to be clear, simple and consistent."
arch=('any')
url="https://snwh.org/moka"
license=('GPL3' 'CCPL-4.0:by-sa')
depends=('faba-icon-theme')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/moka-project/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('e52fb3c39bae53f547e61dd92bebf173')
sha512sums=('81be63f0fe4b47eb70ca63681b40053c8facb7277d5df34212592a1fc7c349679508551e6ff67123127d372e88f61062ce59dd9c8ed6aaa02b49ef9e884e2b07')

build() {
  cd "$pkgname-$pkgver"
  bash autogen.sh
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
