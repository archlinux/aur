pkgname=moka-icon-theme
pkgver=5.3.6
pkgrel=1
pkgdesc="A stylized Linux desktop icon set, designed to be clear, simple and consistent."
arch=('any')
url="https://snwh.org/moka"
license=('GPL3' 'CCPL-4.0:by-sa')
depends=('faba-icon-theme')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/snwh/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('819b8bf752bbe573ad51e77e3cfe6a85')
sha512sums=('b5967eab0e06639b515af5d57d03adb0055c202327a45f5656cc08e87444eff7563a8a7e6a20ec28edef112d4ce5709dd413832d0265d1b33d496067d8c68838')

build() {
  cd "$pkgname-$pkgver"
  bash autogen.sh
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
