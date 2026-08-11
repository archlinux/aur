# Maintainer: Devel <Denislav08@proton.me>
# Contributor: loafer <davemogan353 at btinternet dot com>

pkgname=xstdcmap
pkgver=1.0.6
pkgrel=1
pkgdesc="A X standard colormap utility"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/"
license=('GPL')
depends=(libxmu)
source=(https://xorg.freedesktop.org/releases/individual/app/"$pkgname-$pkgver".tar.xz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
md5sums=('18219284060ebc23084452326c661630')
