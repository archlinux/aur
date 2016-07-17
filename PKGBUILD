# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: ArchAssault <team at archassault dot org>
# Contributor: Jeremy Lynch <jl at archassault dot org>

pkgname=python2-enum
pkgver=0.4.6
pkgrel=1
pkgdesc="Robust enumerated type support in Python."
arch=('any')
url="http://pypi.python.org/pypi/enum/"
license=('GPL2')
depends=('python2')
makedepends=('python2-distribute')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://pypi.python.org/packages/source/e/enum/enum-${pkgver}.tar.gz")
sha512sums=('b3ccc5bd7cc613f7683f12247a26aae9dacde37e60616c3078c7505fb1defbb512451a2e3e8cd1db3e84d115af01420e3ceaea0d58ae38975f40220e59531227')

build() {
  cd "enum-${pkgver}"
  python2 setup.py build
}

package() {
  cd "enum-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 
}
