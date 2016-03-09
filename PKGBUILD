# Maintainer: petRUShka <petrushkin@yandex.ru>

pkgname=nuvolaplayer
pkgver=3.0.1
pkgrel=1
pkgdesc="Cloud music integration for your Linux desktop."
arch=('i686' 'x86_64')
url="https://tiliado.eu/nuvolaplayer/"
license=('GPL')
makedepends=('python')
depends=('diorite' 'vala' 'webkit2gtk' 'libarchive' 'gtk3' 'libnotify' 'json-glib')
conflicts=('nuvolaplayer-git')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)

sha256sums=('a0d5dcda6078820536d37761a037b7ad276891b7b7c038e8ce286edde7ee1053')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python ./waf configure --prefix=/usr
  python ./waf build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python ./waf install --no-system-hooks --destdir="${pkgdir}"
}
