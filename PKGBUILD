# Maintainer: Jaume Delclòs <jaume@delclos.com>
pkgname=blue-spider-git
pkgver=r128.2238b67
pkgrel=1
pkgdesc="A map editor for Pokémon GBA ROMs"
arch=(any)
url="https://github.com/cosarara97/blue-spider"
license=('GPL')
depends=('python' 'python-pillow' 'python-pyqt5')
makedepends=('git')
options=(!emptydirs)
source=('blue-spider::git+https://github.com/cosarara97/blue-spider.git')
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/blue-spider"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/blue-spider"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
