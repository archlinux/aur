# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=python-pyliblo
pkgver=0.10.0
pkgrel=1
pkgdesc='Python wrapper for the liblo OSC library'
arch=('i686' 'x86_64')
url='http://das.nasophon.de/pyliblo/'
license=('GPL')
depends=('python' 'liblo>=0.27')
makedepends=('cython')
source=("http://das.nasophon.de/download/pyliblo-${pkgver}.tar.gz")
sha512sums=('d2a3d47f6c52d310104256d33fbd5d652ae6bc8cde32c2d3b2f3f407b8a4aba99028e57cd466804d266f63468a6c792760f28a43dbabcfa3330e0a852ee4d4e3')

build() {
  cd "${srcdir}/pyliblo-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/pyliblo-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}/"
}
