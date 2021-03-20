# Maintainer: Boris Timofeev <btimofeev at emunix dot org>
pkgname=zxtune123
pkgver=r4980
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
md5sums=('dcd248336f8c6eef0af34824fb45d364')

build() {
  cd "$srcdir/zxtune-$pkgver"
  make platform=linux system.zlib=1 release=1 -C apps/zxtune123
}

package() {
  cd "$srcdir/zxtune-$pkgver"
  make DESTDIR="${pkgdir}" platform=linux release=1 install_linux -C apps/zxtune123
}

