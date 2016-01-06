# Maintainer: petRUShka <petrushkin@yandex.ru>

pkgname=diorite
pkgver=0.2.0
pkgrel=1
pkgdesc="Utility and widget library based on Glib and GTK3."
arch=('i686' 'x86_64')
url="https://tiliado.eu/diorite"
license=('GPL')
provides=('diorite')
depends=('python' 'vala' 'glib2' 'gtk3')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('f4517f148b8296f6c72146769f8537c1348ee9e87eb0171e0213858a0d0aae8d')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./waf configure --prefix=/usr
  ./waf build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./waf install --destdir="${pkgdir}"
}
