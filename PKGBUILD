# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=python-jpype1
_pkgname=jpype
pkgver=0.7.4
pkgrel=1
pkgdesc="Python to Java bridge, an effort to allow Python programs full access to Java class libraries"
arch=('x86_64')
url="https://github.com/jpype-project/${_pkgname}"
license=('APACHE')
makedepends=('python-setuptools' 'ant')
depends=('python')
conflicts=('jpype' 'python-jpype')
source=("JPype1-${pkgver}.tar.gz"::"https://github.com/jpype-project/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('04908b361bde115b618fd18c515b72440d9d56c59958d5275043cc3c4067722d')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

