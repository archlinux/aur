# Maintainer: Tomas S. <me+aur at wereii.cz>
# Contributor: Simon Perry <aur [at] sanxion [dot] net>

pkgname=python-diskcache
pkgver=5.6.1
pkgrel=1
pkgdesc="Python disk and file backed cache library"
arch=('any')
license=('Apache')
url="https://github.com/grantjenks/python-diskcache"
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/grantjenks/python-diskcache/archive/v${pkgver}.tar.gz")
sha256sums=('142328d42c620bd426354d379ba18fb92c3037588cfec7ac2995549b4a0fd1f4')

build() {
  cd "${srcdir}"/"${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}"/"${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

