# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=python-jpype1
_pkgname=jpype
pkgver=1.4.1
pkgrel=1
pkgdesc="Python to Java bridge, an effort to allow Python programs full access to Java class libraries"
arch=('x86_64')
url="https://github.com/jpype-project/${_pkgname}"
license=('APACHE')
makedepends=('python-setuptools' 'ant')
depends=('python' 'python-typing_extensions' 'python-packaging' 'java-runtime')
conflicts=('jpype' 'python-jpype')
source=("JPype1-${pkgver}.tar.gz"::"https://github.com/jpype-project/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a5f56760560b75aef9db782140ad69f65786b5d253e153261ff4d067ae181ae9')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

