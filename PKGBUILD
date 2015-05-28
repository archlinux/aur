# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Kevin Piche <kevin@archlinux.org>

pkgname=wmix
pkgver=3.2+20141005
pkgrel=3
pkgdesc="Dockapp mixer for OSS or ALSA"
arch=('i686' 'x86_64')
url="http://windowmaker.org/dockapps/?name=$pkgname"
license=('GPL')
depends=('libxpm')
source=("$pkgname-$pkgver.tar.gz::http://windowmaker.org/dockapps/?download=$pkgname-$pkgver.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir"/dockapps-c1906c4
  make
}
package() {
  cd "$srcdir"/dockapps-c1906c4
  install -Dm755 wmix "$pkgdir/usr/bin/wmix"
  install -Dm644 wmix.1x "$pkgdir/usr/share/man/man1/wmix.1"
}
