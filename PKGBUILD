pkgname=moka-icon-theme
pkgver=5.3.2
pkgrel=1
pkgdesc="A stylized Linux desktop icon set, designed to be clear, simple and consistent."
arch=('any')
url="https://snwh.org/moka"
license=('GPL3' 'CCPL-4.0:by-sa')
depends=('faba-icon-theme')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/moka-project/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('521f554334d2e0f9df388918aa9699c7')
sha512sums=('396f1cc24a37300f0d3262b10b33f4881b568c02118370fc07ac473c7258dcc509eb9a43fd42159ca8447730393e42452670dfd6cc45fe65c927fabe5e73788e')

build() {
  cd "$pkgname-$pkgver"
  bash autogen.sh
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
