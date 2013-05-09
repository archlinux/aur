# Maintainer: Todd Harbour <aur @AT@ quadronyx .DOT. org>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=wmdiskmon
pkgver=0.0.2
pkgrel=4
pkgdesc="dockapp that monitors your disks usage in a portable way, using the POSIX command df -P."
url="http://tnemeth.free.fr/projets/dockapps.html"
arch=("i686" "x86_64")
license=("GPL")
depends=('libxpm')
source=(http://tnemeth.free.fr/projets/programmes/$pkgname-$pkgver.tar.gz)
md5sums=('4b02066a58752c3e7100abc0544c2c66')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
