# Maintainer: Dian M Fay <dian.m.fay@gmail.com>
_name=pydruid
pkgname=python-pydruid
pkgver=0.6.1
pkgrel=1
pkgdesc="A Python connector for Apache Druid"
arch=("any")
url="https://pypi.python.org/pypi/$_name"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
conflicts=("${pkgname}" "${pkgname}-git")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d815725ecabaff20fc580c6b516327eb8f122c4f28a3e561ea978322dbe7b652')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 || return 1
}
