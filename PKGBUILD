# Maintainer: willemw <willemw12@gmail.com>
# Contributor: LinRs <20455421+LinRs AT users.noreply.github.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Christoph 'delmonico' Neuroth <delmonico@gmx.net>

pkgname=snownews
pkgver=1.8
pkgrel=1
pkgdesc="RSS feed reader for the command-line"
arch=('x86_64')
url="https://github.com/msharov/snownews"
license=('GPL3')
depends=('curl' 'libxml2')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('90d2611b3e3a00bc14a8869365d366ad1dab17ea1687857440159fc7137c3bed')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix="$pkgdir/usr"
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

