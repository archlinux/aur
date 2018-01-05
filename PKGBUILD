# Maintainer:
# Contributor: Kyle Terrien <kyleterrien at gmail dot com>

pkgname=wmload
pkgver=0.9.7
pkgrel=1
pkgdesc="Dockable CPU indicator for Window Maker"
arch=('i686' 'x86_64')
url="http://www.dockapps.net/wmload"
license=('GPL')
depends=('libxpm')
source=("dockapps-$pkgname-$pkgver.tar.gz::https://github.com/d-torrance/dockapps/archive/wmload-$pkgver.tar.gz")
sha256sums=('2471ff43465908c1dde098818a7d54504584f7f2c90b34707c64b4faa95b5900')

build() {
  cd dockapps-$pkgname-$pkgver/$pkgname
  make
}

package() {
  cd dockapps-$pkgname-$pkgver/$pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 README "$pkgdir"/usr/share/doc/wmload/README
}
