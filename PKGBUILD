# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=2ping
pkgver=4.4
pkgrel=1
pkgdesc="a bi-directional ping utility"
arch=('any')
url="https://www.finnie.org/software/2ping/"
license=("GPL2")
depends=("python" "python-dnspython" "python-netifaces" "python-pycryptodome")
makedepends=("python-setuptools")
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/rfinnie/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a51ab4c4f8cd8eccde62244c70b89b09e995604ccfaa117a305052d1be5388e0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/2ping/COPYING"
}
