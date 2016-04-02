# Maintainer: Splith <spam at helper3000 net>

gitdir=vgmstream
pkgname=audacious-vgmstream
pkgver=r1004
pkgrel=1
pkgdesc="A library for playing streamed audio from video games (for Audacious)"
url="https://github.com/kode54/vgmstream"
license=('custom')
arch=('i686' 'x86_64')
depends=( 'audacious' 'libvorbis' )
source=("git+https://github.com/kode54/vgmstream.git")
md5sums=('SKIP')

prepare() {
  cd $gitdir

  ./bootstrap
  ./configure
}

build() {
  cd $gitdir

  make -f Makefile.unix
}

package () {
  cd $gitdir

  make DESTDIR="$pkgdir" install -f Makefile.unix
  mkdir -p "${pkgdir}/usr/share/licenses/vgmstream-git/"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/vgmstream-git/LICENSE"
}

