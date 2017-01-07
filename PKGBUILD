# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=rubber-git
pkgver=1.4.13.g675bfe3
pkgrel=1
pkgdesc="A wrapper for LaTeX and friends, latest git version."
arch=('any')
url="https://launchpad.net/rubber"
license=('GPL')
depends=('python2' 'texlive-core')
install=rubber.install
makedepends=('git' 'texinfo' 'texlive-plainextra')
provides=('rubber')
conflicts=('rubber')
replaces=('rubber-darcs' 'rubber-bzr')
source=('rubber::git+https://git.launchpad.net/rubber')
sha512sums=('SKIP')

pkgver() {
  cd rubber
  git tag -f 1.4 2f47fb0fda47ee12a17a172c3d6fdebae9f53a5d
  git describe --tags | tr - .
}

build() {
  cd rubber
  python2 setup.py build
}

package() {
  cd rubber
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

