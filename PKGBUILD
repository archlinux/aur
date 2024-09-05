# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: brent s. <bts[at]square-r00t[dot]net>
#TODO: clean up this shit
_pkg=whois
_name="py${_pkg}"
_pkgname="python_${_pkg}"
pkgname=(
  "python-${_pkg}")
pkgbase="${pkgname}"
pkgver=0.9.4
pkgrel=2
pkgdesc="Whois querying and parsing of domain registration information"
arch=(
  any
)
url="https://bitbucket.org/richardpenman/${_name}"
license=('MIT')
depends=(
  "python"
  "python-dateutil"
  "python-pysocks"
)
makedepends=(
  "python-setuptools"
)
install=
changelog=
noextract=()
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
_pypi_repo="https://files.pythonhosted.org/packages/source"
source=(
  "${_pypi_repo}/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
  "LICENSE"
)
sha512sums=('a96a68e6ab8f1de181fd401895e6c46cdce8185a0b1815df5fb96ac0f68e12d04d7050aecc64a63b114e6b836a6adc824ee2f5c645da48c26e06af1bdea0e97b'
            '8cf4065e880c751354fffe41f513b95c6bad6bd28033d7a660bd52636cae0c313f9b60f4c53234320699fc0b44d9e4b42bb06f543733b41e0de07a68068099d1')

package_python-whois() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" \
                          --optimize=1
  install -Dm 0644 ${srcdir}/LICENSE \
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
