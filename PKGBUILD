# Contributor: Tomohiro Takezawa <khabus {at} gmail.com>
# Maintainer: yuki-san <yuki.from.akita {at} gmail.com>

pkgname=howm
pkgver=1.4.4
pkgrel=1
pkgdesc="Hitori Otegaru Wiki Modoki: A note-taking tool on Emacs."
arch=('any')
url="http://howm.sourceforge.jp/index.html"
license=('GPL2')
groups=('editors')
depends=('emacs')
optdepends=('ruby: HTML conversion and calendar support')
install=${pkgname}.install
source=("http://howm.sourceforge.jp/a/$pkgname-$pkgver.tar.gz")
md5sums=('79e4846e9917589bed38344828d35908')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
