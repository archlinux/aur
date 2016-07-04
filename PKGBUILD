# Maintainer: Frederic Bezies < fredbezies at gmail dot com >

pkgname=quakespasm
pkgver=0.92.0
pkgrel=2
pkgdesc="A modern Quake 1 engine. Forked from Fitzquake and improved in many ways such as Vorbis/MP3 support for music. Stable version"
arch=('i686' 'x86_64')
url="http://quakespasm.sourceforge.net"
license=('GPL2')
depends=('libvorbis' 'libmad' 'sdl2')
conflicts=('quakespasm-svn')
install=$pkgname.install
source=(https://sourceforge.net/projects/quakespasm/files/Source/$pkgname-$pkgver.tgz)
md5sums=('d7ba2b9eaca198f32f60eeabc1f02db1')

build() {
  cd "$srcdir/$pkgname-$pkgver/Quake/"
  msg "Starting make..."
  make DO_USERDIRS=1 USE_SDL2=1
}

package() {
  cd "$srcdir/$pkgname-$pkgver/Quake/"
  install -Dm755 quakespasm "$pkgdir"/usr/bin/$pkgname
}


