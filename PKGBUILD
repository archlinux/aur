# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Travis Willard <travisw@wmpub.ca>
# Contributor: William Rea <sillywilly@gmail.com>

# https://github.com/orhun/pkgbuilds

pkgname=devilspie
pkgver=0.23
pkgrel=3
pkgdesc='Window matching utility for X'
arch=('x86_64')
url='http://www.burtonini.com/blog/computers/devilspie'
license=('GPL')
depends=('libwnck3')
makedepends=('intltool')
source=("http://www.burtonini.com/computing/$pkgname-$pkgver.tar.xz")
sha256sums=('2dd9d4b7424ac999f20c214b0ff71e8c5836d97003d7a8a7391105cd16d36deb')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $pkgname-$pkgver

  make prefix="$pkgdir"/usr install
  # Make and install blank config
  mkdir -p "$pkgdir"/etc/devilspie
  echo '(debug)' > "$pkgdir"/etc/devilspie/example.ds
}
