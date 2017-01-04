# Maintainer: Václav Valíček <vaclav@valicek.name>
# Contributor: Filipp Andjelo <filipp.andjelo@gmail.com>

pkgname=gconf-cleaner
pkgver=0.0.3
pkgrel=2
pkgdesc="A Cleaning tool for GConf"
arch=(i686 x86_64)
url="http://code.google.com/p/gconf-cleaner"
license=('GPL')
depends=('gconf' 'gtk2')
makedepends=('intltool')
source=(https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/gconf-cleaner/${pkgname}-${pkgver}.tar.gz)
md5sums=('94d28d18c84ba8e9a166937a1e41fb53')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
