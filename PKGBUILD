# Maintainer: Sterophonick
pkgname=midi2agb-ipatix
_pkgname='midi2agb-ipatix'
pkgver=ff820bf
pkgrel=1
pkgdesc="Open-source reimplementation of Nintendo's mid2agb for MusicPlayer2000"
url='https://github.com/ipatix/midi2agb'
arch=(x86_64 i686 aarch64)
depends=()
makedepends=(base-devel)
source=(git+https://github.com/ipatix/midi2agb)
md5sums=('SKIP')
license=('mit')

package() {
  mkdir -p $pkgdir/usr/bin
  cd $srcdir/midi2agb

  # why is this not default?
  # why? has I ever?
  git submodule init
  git submodule update

  make -j$(nproc)
  cp ./midi2agb $pkgdir/usr/bin
}
