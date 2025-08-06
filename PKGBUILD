# Maintainer: Jakub Jirutka <jakub@jirutka.cz>

pkgname=doas-sudo-shim
pkgver=0.1.2
pkgrel=1
pkgdesc="A shim for the sudo command that utilizes doas"
arch=(any)
url="https://github.com/jirutka/doas-sudo-shim"
license=(ISC)
provides=(sudo)
conflicts=(sudo)
depends=(awk doas sh)
makedepends=(asciidoctor)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jirutka/doas-sudo-shim/archive/v$pkgver.tar.gz")
sha256sums=('09bac8d6a07bd6e856adba2eb4b20172bca0fea22dbeb563062b5e277f0ff85d')

build() {
  cd $pkgname-$pkgver
  make man
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir" PREFIX=/usr
}
