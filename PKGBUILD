# Maintainer: petRUShka <petrushkin[at]yandex[dot]ru>
pkgname=crosswordpuzzle
pkgver=1.0rc1
pkgrel=1
pkgdesc="A small crossword puzzle library along with a GTK2 interface for playing and editing."
url="https://launchpad.net/crosswordpuzzle"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('python2' 'pygtk')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
#install='foo.install'
source=("https://launchpad.net/${pkgname}/1.0/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz")
md5sums=('3699b1c8fadd232536d81c462a0749c7')

#build() {
#  cd "${srcdir}/${pkgname}-${pkgver}"
#  python2 setup.py install
#}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
