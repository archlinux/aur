# Maintainer: Tomas S. <me+aur at wereii.cz>
# Contributor: Simon Perry <aur [at] sanxion [dot] net>

pkgname=python-diskcache
pkgver=5.2.1
pkgrel=1
pkgdesc="Python disk and file backed cache library"
arch=('any')
license=('Apache')
url="https://github.com/grantjenks/python-diskcache"
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/grantjenks/python-diskcache/archive/v${pkgver}.tar.gz")
sha256sums=('05bd57edfaf7763b1b90d497bbef848347ef617a1ec71e733e0a4fa10be97612')

build() {
  cd "${srcdir}"/"${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}"/"${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

