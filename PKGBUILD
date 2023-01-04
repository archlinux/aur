# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Felipe F. Tonello <eu@felipetonello.com>

pkgname=python-codegen
pkgver=1.0
pkgrel=5
pkgdesc="Extension to ast that allow ast -> python code generation."
arch=(any)
url="http://github.com/andreif/codegen"
license=(BSD)
makedepends=(python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andreif/codegen/archive/${pkgver}.tar.gz")
sha256sums=('2dadd04a2802de27e0fe5a19b76538f6da9d39ff244036afa00c1bba754de5ee')

build() {
  cd "${srcdir}/codegen-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/codegen-${pkgver}"
  python setup.py install --skip-build --optimize=1 --prefix=/usr --root="${pkgdir}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
