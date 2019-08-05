# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: <johnsirett3@googlemail.com>
# Contributor: Shacristo <Shacristo at gmail dot com>
# Contributor: Jáchym Barvínek <jachymb@gmail.com>

pkgname=lybniz
pkgver=3.0.4
pkgrel=1
pkgdesc="An easy to use mathematical function graph plotter written in Python and GTK."
arch=('any')
url="https://github.com/thomasfuhringer/lybniz"
license=('BSD')
depends=('python-gobject' 'hicolor-icon-theme')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/thomasfuhringer/lybniz/archive/v${pkgver}.tar.gz")
sha256sums=('725c5274115bd7faad3abb0b7cd2ae8a377b73cbcc8b4e8a6c9522a772976983')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
