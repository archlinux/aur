# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=2ping
pkgver=4.2
pkgrel=1
pkgdesc="a bi-directional ping utility"
arch=('any')
url="https://www.finnie.org/software/2ping/"
license=("GPL2")
depends=("python" "python-dnspython" "python-netifaces" "python-pycryptodome")
makedepends=("python-setuptools")
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/rfinnie/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('121cebb25c7bbd54ff94097188f5b3580bcf9ecd413ea876a4fef4aecdb35a73')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/2ping/COPYING"
}
