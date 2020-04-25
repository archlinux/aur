# Maintainer: Simon Perry <aur [at] sanxion [dot] net>

pkgname=python-diskcache
pkgver=4.1.0
pkgrel=1
pkgdesc="Python disk and file backed cache library"
arch=('any')
license=('Apache')
url="https://github.com/grantjenks/python-diskcache"
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/grantjenks/python-diskcache/archive/v${pkgver}.tar.gz")
sha256sums=('ac181e25dee0c1113df0ac591762f1fc457d6cd3ff5a3c8b9ca419575b57fd74')

build() {
  cd "${srcdir}"/"${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}"/"${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

