# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=ogmrip-nero-aac
pkgver=0.5
pkgrel=2
pkgdesc='Plugin which adds support for Nero-AAC audio codec for ogmrip'
arch=('i686' 'x86_64')
url='http://ogmrip.sourceforge.net/en/plugins.html'
license=('LGPL')
groups=('ogmrip')
depends=('ogmrip>=0.13' 'mplayer>=0.92' 'neroaacenc')
source=("http://downloads.sourceforge.net/sourceforge/ogmrip/${pkgname}-${pkgver}.tar.gz"
"http://downloads.sourceforge.net/project/ogmrip/${pkgname}/${pkgver}/README")
sha256sums=('2ed3571a9c39235308506c78c1f802db7398da4adbf038e24ac1a9ee28217a1b'
            '750dfa8013fca8ea92e5456e02a274c14fbba920ff2af9815211b12a62c4df98')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm0644 README ${pkgdir}/usr/share/ogmrip-nero-aac/README
}
