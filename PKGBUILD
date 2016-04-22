# Maintainer: petRUShka <petrushkin@yandex.ru>

pkgname=diorite
pkgver=0.2.1
pkgrel=1
pkgdesc="Utility and widget library based on Glib and GTK3."
arch=('i686' 'x86_64')
url="https://github.com/tiliado/diorite"
license=('GPL')
provides=('diorite')
depends=('python' 'vala' 'glib2' 'gtk3')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
conflicts=('diorite-git')
sha256sums=('188335b58e7fea03e81c89d6f2bb1694063bac34483de05ee1e600e1cf696dd0')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./waf configure --prefix=/usr
  ./waf build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./waf install --destdir="${pkgdir}"
}
