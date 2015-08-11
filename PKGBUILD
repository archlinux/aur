# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Sergio Montesinos <sermonpe@yahoo.es>

pkgname=lingot
pkgver=0.9.1
pkgrel=3
pkgdesc='A musical instrument tuner'
url='http://www.nongnu.org/lingot/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk2' 'libglade>=2.0.0' 'jack')
makedepends=('perl-xml-parser' 'intltool' 'gtk2')
source=("http://download.savannah.gnu.org/releases/lingot/$pkgname-$pkgver.tar.gz")
sha256sums=('ec91223ab3df7c9160e6f1ededd8125e64764360caa0de39f54ef0668d56f979')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
