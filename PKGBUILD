# Maintainer: Swift Geek
pkgname=ncpamixer-git
_pkgname=ncpamixer
pkgver=c03248b
pkgrel=1
pkgdesc="ncurses PulseAudio Mixer"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://github.com/fulhax/ncpamixer"
license=('MIT')
depends=('ncurses' 'pulseaudio')
makedepends=('git' 'cmake')
source=("git://github.com/fulhax/ncpamixer.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-parse --short HEAD # Fix to better comply with github display
}

build() {
  cd "$srcdir/${_pkgname}"
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  #make DESTDIR="${pkgdir}" install
  install -d "$pkgdir/usr/bin/"
  install -m 755 "build/Linux/debug/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
