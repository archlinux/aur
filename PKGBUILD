# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: <craven@gmx.net>

pkgname=foment-git
pkgver=20180519
pkgrel=1
pkgdesc="Foment scheme"
arch=('i686' 'x86_64')
url="https://github.com/leftmike/foment.git"
license=('custom:BSD')
depends=('gcc-libs')
makedepends=('git')
provides=('foment')
conflicts=('foment')
source=("git+https://github.com/leftmike/foment.git")
md5sums=('SKIP')

pkgver() {
  cd foment
  git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
  cd foment/unix
  make
}

package() {
  cd foment
  install -D unix/release/foment "$pkgdir"/usr/bin/foment
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENCE
}
