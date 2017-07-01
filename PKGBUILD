# Maintainer: avkonarev <avkonarev@gmail.com>

pkgname=diorite_0.2.x
_pkgname=diorite
pkgver=0.2.2
pkgrel=1
pkgdesc="Utility and widget library based on Glib and GTK3. 0.2.x branch"
url="https://github.com/tiliado/diorite"
arch=(i686 x86_64)
license=('GPL')
depends=('python' 'vala' 'glib2' 'gtk3')
source=(https://github.com/tiliado/${_pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('334c4daf429f4a4e5f93e4da988173838b67a2988922c996db6a101c401738d9')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  ./waf configure --prefix=/usr
  ./waf build
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  ./waf install --destdir="${pkgdir}"
}
