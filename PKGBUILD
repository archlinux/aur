# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages

pkgname=quickrdp
pkgver=2.4.1
pkgrel=1
pkgdesc="Connection manager program for your remote desktop, telnet, SSH or VNC connections."
arch=('i686' 'x86_64')  # untested on i686; please let me know if it works
url="http://quickrdp.sourceforge.net/"
license=('GPL3')
depends=('wxgtk' 'curl')
optdepends=('rdesktop: remote desktop support')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-src.tar.gz")
md5sums=('c678fa0bb9a7e3459b2bfed6520b865b')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
