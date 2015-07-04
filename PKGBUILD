# Maintainer: Dave Reisner <d@falconindy.com>

pkgname=ponymix-git
pkgver=2.8.gc46779e
pkgrel=1
pkgdesc="CLI PulseAudio Volume Control"
arch=('i686' 'x86_64')
url="http://github.com/falconindy/ponymix"
license=('MIT')
depends=('pulseaudio')
optdepends=('libnotify: desktop volume notifications')
makedepends=('git')
conflicts=('ponymix')
provides=('ponymix')
source=("git://github.com/falconindy/ponymix.git")
md5sums=('SKIP')

pkgver() {
  cd 'ponymix'

  git describe | sed 's/-/./g'
}

build() {
  make -C "$srcdir/ponymix"
}

package() {
  make -C "$srcdir/ponymix" DESTDIR="$pkgdir" install
}

# vim: ft=sh syn=sh et
