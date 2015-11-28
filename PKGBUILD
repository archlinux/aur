# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=rubber-bzr
pkgver=731
pkgrel=1
pkgdesc="A wrapper for LaTeX and friends, latest bzr version."
arch=('any')
url="https://launchpad.net/rubber"
license=('GPL')
depends=('python2' 'texlive-core')
install=rubber.install
makedepends=('bzr' 'texinfo' 'texlive-plainextra')
provides=('rubber')
conflicts=('rubber')
replaces=('rubber-darcs')
source=('rubber::bzr+http://bazaar.launchpad.net/~rubber-devs/rubber/main/')
sha512sums=('SKIP')

pkgver() {
  cd rubber
  bzr revno
}

build() {
  cd rubber
  python2 setup.py build
}

package() {
  cd rubber
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

