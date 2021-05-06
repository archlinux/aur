# Maintainer: willemw <willemw12@gmail.com>
# Contributor: LinRs <20455421+LinRs AT users.noreply.github.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Christoph 'delmonico' Neuroth <delmonico@gmx.net>

pkgname=snownews
pkgver=1.7
pkgrel=1
pkgdesc="RSS feed reader for the command-line"
arch=('x86_64')
url="https://github.com/msharov/snownews"
license=('GPL3')
depends=('curl' 'libxml2')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('42b92add70f397b6a4f804093af4798115d404b81bda05fa4db373cd9d78a0c5')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix="$pkgdir/usr"
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

