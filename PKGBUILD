# Maintainer: Jingbei Li <i@jingbei.li>
# Contributer: Jose Riha <jose1711 gmail com>
pkgname=python-audioread
_pkgname=audioread
pkgver=3.0.0
pkgrel=1
pkgdesc="cross-library (GStreamer + Core Audio + MAD + FFmpeg) audio decoding for Python"
arch=('any')
url="https://github.com/beetbox/audioread"
license=('MIT')
makedepends=('python-setuptools')
source=("$url/archive/v${pkgver}.tar.gz")
sha256sums=('57766a926f522e9a05ccd07d438d0c8998fc53d0489efeb40a256d7ca42b1369')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py build
}

package_python-audioread() {
  depends=('python')
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}

# vim:set ts=2 sw=2 et:
