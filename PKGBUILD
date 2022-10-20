# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=python-jpype1
_pkgname=jpype
pkgver=1.4.0
pkgrel=1
pkgdesc="Python to Java bridge, an effort to allow Python programs full access to Java class libraries"
arch=('x86_64')
url="https://github.com/jpype-project/${_pkgname}"
license=('APACHE')
makedepends=('python-setuptools' 'ant')
depends=('python')
conflicts=('jpype' 'python-jpype')
source=("JPype1-${pkgver}.tar.gz"::"https://github.com/jpype-project/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('35516d4b65569ccb2adaec979e9a3506437768d90588a898b3cd33283f25fccc')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

