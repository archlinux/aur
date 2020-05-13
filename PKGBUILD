# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Tomasz Zok <tomasz.zok@gmail.com>
pkgname=python-academic-admin
pkgver=0.5.1
pkgrel=1
pkgdesc="An admin tool for Academic website framework"
arch=(any)
url="https://github.com/sourcethemes/academic-admin"
license=(MIT)
depends=(python python-bibtexparser python-toml)
options=(!emptydirs)
source=(https://github.com/sourcethemes/academic-admin/archive/${pkgver}.tar.gz)
sha256sums=('72928adac90aa43cfc252f3bc0caa7c821c957c1b050caa0417cfe4523cd96ea')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
