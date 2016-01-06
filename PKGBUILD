# Maintainer: petRUShka <petrushkin@yandex.ru>

pkgname=nuvolaplayer
pkgver=3.0.0
pkgrel=1
pkgdesc="Cloud music integration for your Linux desktop."
arch=('i686' 'x86_64')
url="https://tiliado.eu/nuvolaplayer/"
license=('GPL')
makedepends=('python')
depends=('diorite' 'vala' 'webkit2gtk' 'libarchive' 'gtk3' 'libnotify' 'json-glib')
conflicts=('nuvolaplayer-git')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)

sha256sums=('6f110d6bbb1ad76f5dba71f942cf78179f4183757392890e7e19706ba7235b7b')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python ./waf configure --prefix=/usr
  python ./waf build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python ./waf install --no-system-hooks --destdir="${pkgdir}"
}
