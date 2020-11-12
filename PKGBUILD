# Maintainer: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Stunts <f.pinamartins at gmail dot com>
# Contributor: damir <damir at archlinux dot org>

pkgname=python-biopython
_pkgname=biopython
pkgver=1.78
pkgrel=2
pkgdesc="Freely available Python tools for computational molecular biology"
arch=('x86_64')
url="http://www.biopython.org"
license=('custom')
makedepends=('python-setuptools')
depends=('python-numpy')
optdepends=('python-mysql-connector: for BioSQL module')
source=(http://www.biopython.org/DIST/${_pkgname}-${pkgver}.tar.gz)
changelog=ChangeLog
sha512sums=('5e7a2584f067b9c1636c844452fca6561dbd217309205e9215c879a56956842192712c58fe7cf4ecd2b8841aa099f7974c6a8055700e1e3ae4a10529f7165646')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE.rst" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
