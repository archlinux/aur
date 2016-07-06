pkgname=faba-icon-theme
pkgver=4.1.2
pkgrel=1
pkgdesc="A sexy and modern icon theme with Tango influences."
arch=('any')
url="https://snwh.org/moka"
license=('LGPL3' 'CCPL-4.0:by-sa')
depends=('gtk-update-icon-cache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/moka-project/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('7966a99b8e9098e2474655229093e08c')
sha512sums=('fd11e0aa1ab3e57ec2bde29a493dd58922759080291e7bd91b53d1395984a33e1e82da606d8e08fd8ce16e82f3709e90b12e5592261e2e450ad54d2a43d49fe4')

build() {
  cd "$pkgname-$pkgver"
  bash autogen.sh
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
