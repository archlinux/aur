# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Sergio Montesinos <sermonpe@yahoo.es>

pkgname=lingot
pkgver=1.0.1
pkgrel=1
pkgdesc='A musical instrument tuner'
url='http://www.nongnu.org/lingot/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk3')
makedepends=('perl-xml-parser' 'intltool')
source=("http://download.savannah.gnu.org/releases/lingot/$pkgname-$pkgver.tar.gz")
sha256sums=('71b8c77bb988e8384a0ecbf4c861d838f7b985284a8e18f75532ab9816c6a00f')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
