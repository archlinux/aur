# Maintainer: Ainola
# Contributor: Fabien Bourigault

pkgname=nuntius
pkgver=0.2.0
pkgrel=2
pkgdesc="Nuntius delivers notifications from your phone or tablet to your computer"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/holylobster/nuntius-linux"
depends=('gtk3')
makedepends=('vala' 'intltool')
conflicts=('nuntius-git')
install=nuntius.install
source=(https://github.com/holylobster/nuntius-linux/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('5e0b4d97aa3e4f435b8468728751d3ea58c1739f4fc3f0312693773ae89fe67e')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
