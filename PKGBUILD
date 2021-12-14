# Maintainer: Victor <v1c70rp@gmail.com>
# Contributor: Clint Valentine <valentine.clint@gmail.com>
# Contributor: Kyle Meyer <kyle@kyleam.com>

_name=palettable
pkgname=python-palettable
pkgver=3.3.0
pkgrel=2
pkgdesc="Color palettes for Python"
arch=('any')
url="https://pypi.org/project/palettable"
license=('MIT')
depends=('python' 'python-matplotlib')
makedepends=('python-setuptools')
replaces=('python-brewer2mpl')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.io/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/jiffyclub/palettable/d267e4aa8f746ab800d4998e670d60eca13f32cd/license.txt")
sha256sums=('72feca71cf7d79830cd6d9181b02edf227b867d503bec953cf9fa91bf44896bd'
            '06982353629cfa6b7b339fa4cfccd6eca5a4434d5caefb7c32e68baa41a1be7c')

build(){
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txts"
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
