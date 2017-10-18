# Maintainer: Marco Scopesi <marco.scopesi@gmail.com>
pkgname=pydocstyle
pkgver=2.1.1
pkgrel=1
pkgdesc="PEP 257 docstring style checker."
arch=(any)
url="https://github.com/PyCQA/pydocstyle"
license=('MIT')
depends=('python' 'python-snowballstemmer')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/PyCQA/pydocstyle/archive/${pkgver}.tar.gz")
sha1sums=('7b493316733068f6b662d272627f7927f1c0cbeb')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1

  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE-MIT
}
