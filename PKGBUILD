# Contributor: Jonathan Liu <net147@gmail.com>
# Maintainer: Thomas Koller-Cherek <tk120 at protonmail dot com>

pkgname=python2-pyicu
_realpkgname=PyICU
pkgver=2.4.2
pkgrel=1
pkgdesc="Python binding for ICU"
arch=('x86_64' 'i686')
url="https://github.com/ovalhub/pyicu"
license=('custom')
depends=('python2' 'icu')
makedepends=('gcc')
source=("https://files.pythonhosted.org/packages/95/0c/0fb09019efb65a29789ec5538f8e521b8f548da6935a3a474e19fbf2ea4d/${_realpkgname}-${pkgver}.tar.gz")
md5sums=('bb09676c234849f586094e3fe99c3606')

build() {
  cd "${srcdir}/${_realpkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_realpkgname}-${pkgver}"
  python2 setup.py install --root "${pkgdir}" -O1
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D -m644 "${srcdir}/${_realpkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
