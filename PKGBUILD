# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=python-jpype1
_pkgname=jpype
pkgver=1.5.2
pkgrel=1
pkgdesc="Python to Java bridge, an effort to allow Python programs full access to Java class libraries"
arch=('x86_64')
url="https://github.com/jpype-project/${_pkgname}"
license=('Apache-2.0')
makedepends=('ant' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('python' 'python-typing_extensions' 'python-packaging' 'java-runtime')
conflicts=('jpype' 'python-jpype')
source=("JPype1-${pkgver}.tar.gz"::"https://github.com/jpype-project/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e5bb06e49cfa3879bd29e1a4cf2b92b417ff5a5d6f5bca4fb1bc20194db150df')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

