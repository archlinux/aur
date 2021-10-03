# Maintainer: willemw <willemw12@gmail.com>
# Contributor: LinRs <20455421+LinRs AT users.noreply.github.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Christoph 'delmonico' Neuroth <delmonico@gmx.net>

pkgname=snownews
pkgver=1.9
pkgrel=1
pkgdesc="RSS feed reader for the command-line"
arch=('x86_64')
url="https://github.com/msharov/snownews"
license=('GPL3')
depends=('curl' 'libxml2')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d8ef0c7ef779771e2c8322231bdfa7246d495ba8f24c3c210c96f3b6bd3776a7')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

