pkgname=moka-icon-theme
pkgver=5.4.0
pkgrel=1
pkgdesc="A stylized Linux desktop icon set, designed to be clear, simple and consistent."
arch=('any')
url="https://snwh.org/moka"
license=('GPL3' 'CCPL-4.0:by-sa')
depends=('faba-icon-theme')
makedepends=('meson')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/snwh/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('27d2e54bf33bcb428ece6ff2a97e2b67')
sha512sums=('3cb6889eae3ddfcad68a05fd6cdf5e92b5d78b965b22df1c289f1e274491be8cb967965cbdf430fe218337994b19592546f3cadf8c39ff5e573d6d7e76648238')

build() {
  cd "$pkgname-$pkgver"
  arch-meson . build
  ninja -C build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" ninja -C build install
}
