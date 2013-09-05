# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Kevin Piche <kevin@archlinux.org>

pkgname=wmix
pkgver=3.2
pkgrel=1
pkgdesc="Dockapp mixer for OSS or ALSA"
arch=('i686' 'x86_64')
url="http://dockapps.windowmaker.org/file.php/id/58"
license=('GPL')
depends=('libxpm')
source=("http://dockapps.windowmaker.org/download.php/id/528/${pkgname}-${pkgver}.tar.gz")
md5sums=('ce87c48cadf51b3cd6224ef698d3f2cc')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -dm755 "$pkgdir/usr/bin"
  make PREFIX="$pkgdir/usr" install
  install -D -m644 wmix.1x.gz "$pkgdir/usr/share/man/man1/wmix.1x.gz"
}
