pkgname='python-luadata'
pkgver=1.0.5
pkgrel=1
pkgdesc="Serialize/unserialise between Python lists/dictionaries and Lua tables"
arch=('any')
license=('BSD')
url='https://github.com/leafvmaple/luadata'
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/leafvmaple/luadata/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('173e8a750a120f6459f1741a43552e01d53c2d5a694b9dd0cec4749c308a6cf0')

build() {
  cd luadata-${pkgver}
  python setup.py build
}

package() {
  cd luadata-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}