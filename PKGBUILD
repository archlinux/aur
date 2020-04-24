# Maintainer: Boris Timofeev <btimofeev at emunix dot org>
pkgname=zxtune123
pkgver=r4891
pkgrel=1
pkgdesc="Chiptune player, CLI version"
arch=('i686' 'x86_64')
url="https://zxtune.bitbucket.io/"
license=('GPL')
depends=('boost-libs')
makedepends=('gcc' 'boost')
optdepends=()
conflicts=('zxtune-git' 'zxtune-bin')
source=(https://github.com/vitamin-caig/zxtune/archive/$pkgver.tar.gz)
md5sums=('c0cc62f06849154c22a3131778bb7369')

build() {
  cd "$srcdir/zxtune-$pkgver"
  make platform=linux system.zlib=1 release=1 -C apps/zxtune123
}

package() {
  cd "$srcdir/zxtune-$pkgver"
  make DESTDIR="${pkgdir}" platform=linux release=1 install_linux -C apps/zxtune123
}

