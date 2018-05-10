# Maintainer: Simon Perry <aur [at] sanxion [dot] net>

pkgname=python-diskcache
pkgver=3.0.6
pkgrel=1
pkgdesc="Python disk and file backed cache library"
arch=('any')
license=('Apache')
url="https://github.com/grantjenks/python-diskcache"
makedepends=('python-setuptools')
source=("https://github.com/grantjenks/python-diskcache/archive/v${pkgver}.tar.gz")
sha256sums=('8e286e1173ae7a4722d35ba4e44c6d75cf30d04566df04facd2a4c7c7a13a14b')

build() {
  cd "${srcdir}"/"${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}"/"${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

