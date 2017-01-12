pkgname=paper-icon-theme
pkgver=1.4.0
pkgrel=1
pkgdesc="Paper is an open source desktop theme and icon project by Sam Hewitt"
arch=('any')
url="https://snwh.org/paper"
license=("CCPL:by-sa-4.0")
depends=('gtk-update-icon-cache')
provides=('paper-icon-theme')
conflicts=('paper-icon-theme-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/snwh/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('076e1dfa1bc5928f4c6616ffd933926a')
sha512sums=('8089a926d61d22fea9f5145ae383e1558c792bd4bf0dc4b74b1bab0b6bfae987275512ec54e7d966fb18329804470f08759205ad0270624a0243a0394b1d0727')

build() {
  cd "$pkgname-$pkgver"
  bash autogen.sh
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
