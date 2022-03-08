# Maintainer: Stefan Mark <mark at unserver dot de>

pkgname=saparoton-git
_pkgname=maasul
pkgver=666.0.3
pkgrel=1
pkgdesc="Simple TUI interface for madasul"
url="https://git.weitnahbei.de/nullmark/saparoton"
arch=('i686' 'x86_64')
license=('GPL')
depends=('socat')
optdepends=()
makedepends=('git')
provides=('saparoton')
conflicts=('saparoton')
source=("$_pkgname::git+http://git.weitnahbei.de/nullmark/saparoton")
sha256sums=('SKIP')

build() {
  cd $_pkgname
  make
}

package() {
  cd $_pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D README "$pkgdir/usr/share/doc/$pkgname/README.md"
}
