# Contributor: Tomohiro Takezawa <khabus {at} gmail.com>
# Maintainer: Yuki Chiba <yuki.from.akita {at} gmail.com>

pkgname=howm
pkgver=1.4.2
pkgrel=1
pkgdesc="Hitori Otegaru Wiki Modoki: A note-taking tool on Emacs."
arch=('any')
url="http://howm.sourceforge.jp/index.html"
license=('GPL2')
groups=('editors')
depends=('emacs')
optdepends=('ruby: HTML conversion and calendar support')
#install=${pkgname}.install
source=("http://howm.sourceforge.jp/a/$pkgname-$pkgver.tar.gz")
md5sums=('704001b8e4031e3293fc3eb1cb08befa')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
