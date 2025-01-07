# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-xml
_project=gawkextlib
pkgver=1.1.2
pkgrel=1
pkgdesc="GAWK extension - interface to Expat for parsing XML"
arch=('x86_64' 'aarch64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL-1.0-or-later AND GPL-3.0-or-later')
depends=('bash' 'expat' 'gawkextlib' 'glibc')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('6af9071170051a5d458ccde5a886a471')
sha256sums=('9ae39935cc5df1aebc805d7c7797c6cf42da5e74e3dfdc35b67ad237f8460f50')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-silent-rules
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
