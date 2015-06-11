# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: biell <biell@pobox.com>
# Contributor: dax <dax@deelab.org>

pkgname=gkrelltop
pkgver=2.2.13
pkgrel=4
pkgdesc="Displays the top-x cpu hogging tasks"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gkrelltop"
license=('GPL')
depends=('gkrellm')
source=("http://downloads.sourceforge.net/gkrelltop/${pkgname}_${pkgver}.orig.tar.gz")
md5sums=('53994487dd5727348b9950b7f2896756')

build() {
  cd "$srcdir/$pkgname-$pkgver.orig"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver.orig"
  install -D -m644 gkrelltop.so "$pkgdir/usr/lib/gkrellm2/plugins/$pkgname.so"
}
