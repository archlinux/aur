# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=python-jpype1
_pkgname=jpype
pkgver=1.3.0
pkgrel=1
pkgdesc="Python to Java bridge, an effort to allow Python programs full access to Java class libraries"
arch=('x86_64')
url="https://github.com/jpype-project/${_pkgname}"
license=('APACHE')
makedepends=('python-setuptools' 'ant')
depends=('python')
conflicts=('jpype' 'python-jpype')
source=("JPype1-${pkgver}.tar.gz"::"https://github.com/jpype-project/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('90728f0cb472c7399e2f6d08690af4a81de76dec16fc7f29ac2fcd776afae2ac')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

