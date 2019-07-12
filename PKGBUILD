# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Michael J. Pento <mjpento@verizon.net>

pkgname=onioncircuits
pkgver=0.6
pkgrel=1
pkgdesc="GTK application to display Tor circuits and streams"
arch=('any')
url="https://git-tails.immerda.ch/onioncircuits"
license=('GPL3')
depends=('tor' 'hicolor-icon-theme' 'python>=3.4.2' 'python-gobject>=3.14.0' 'python-stem>=1.2.2' 'gobject-introspection' 'python-pycountry')
makedepends=('git' 'python-setuptools' 'python-distutils-extra')
_commit=1355de00e8c1e944458a270cec1b1692ae69178a  # tags/0.6^0
source=("git+https://git-tails.immerda.ch/onioncircuits#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
