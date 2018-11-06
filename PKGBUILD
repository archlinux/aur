# Maintainer: Josef Erben <firstname at lastname dot io>

pkgname=memb
pkgver=0.0.2
pkgrel=1
pkgdesc="A tool to manage a local text-based knowledge base"
url="https://github.com/jerben/memb"
arch=('any')
license=('MIT')
depends=('grep')
source=("https://github.com/jerben/memb/archive/$pkgver.tar.gz")
sha256sums=('105e0960d50ff495b8bcccd69a45652ea0959c72feda44a1c27f06bf386e6da0')

check() {
  cd "${pkgname}-${pkgver}"
  ./memb_test
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 memb "$pkgdir/usr/bin/memb"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
