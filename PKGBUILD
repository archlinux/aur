# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=python-pyicu
_realpkgname=PyICU
pkgver=1.9.2
pkgrel=1
pkgdesc="Python binding for ICU"
arch=('i686' 'x86_64')
url="http://pyicu.osafoundation.org/"
license=('custom')
depends=('python' 'icu')
source=("http://pypi.python.org/packages/source/P/${_realpkgname}/${_realpkgname}-${pkgver}.tar.gz")
md5sums=('a104ea78918a8b1f4ecbbb1063edb46b')

build() {
  cd "${srcdir}/${_realpkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_realpkgname}-${pkgver}"
  python setup.py install --root "${pkgdir}" -O1
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D -m644 "${srcdir}/${_realpkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
