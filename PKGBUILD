pkgname=tikzit
pkgver=1.0
pkgrel=1
pkgdesc="Allows the creation and modification of TeX diagrams written using the pgf/TikZ macro library"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/tikzit/"
license=('GPL2')
depends=('gnustep-base>=1.18.0' 'gtk2>=2.18.0'
         'poppler-glib>=0.10' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('gcc-objc>=4.6.0')
optdepends=('texlive-core: previews')
install="tikzit.install"
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('5d7fc5a74500b8eb2545d0c4fece62a5')

build() {
  source /etc/profile.d/GNUstep.sh
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
}

package() {
  source /etc/profile.d/GNUstep.sh
  cd "$srcdir/$pkgname-$pkgver"
  make "DESTDIR=$pkgdir" install || return 1
}

# vim: set ts=2 sw=2 et:
