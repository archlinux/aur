# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: bwalle Bernhard Walle bernhard ___ bwalle.de
# Contributor: Karol Babioch <karol@babioch.de>

_tarname='pysnmp'
pkgname="python2-${_tarname}"
pkgver='4.4.4'
pkgrel='1'
pkgdesc='Pure Python, open source and free implementation of v1/v2c/v3 SNMP engine'
arch=('any')
#url="https://sourceforge.net/projects/${_tarname}/"
url="https://github.com/etingof/${_tarname}"
license=('BSD')
depends=('python2' 'python2-pyasn1>=0.2.3' 'python2-pysmi' 'python2-pycryptodomex')
optdepends=('python2-pycrypto: SNMPv3 support')
_verwatch=("${url}/releases.atom" "\s\+<title>PySNMP \([^<]\+\)</title>.*" 'f') # RSS
#source=("https://downloads.sourceforge.net/project/${_tarname}/${_tarname}/${pkgver}/$_tarname-${pkgver}.tar.gz")
source=("${_tarname}-${pkgver}.tar.gz::https://github.com/etingof/${_tarname}/archive/v${pkgver}.tar.gz")
md5sums=('57c43210a018876843139d704cb9d3de')
sha256sums=('e035a4b9f84217ab534d49d2af3822dcd8731b378ae5b6237292fc76eabbf7a0')

package() {
  cd "${srcdir}/$_tarname-${pkgver}"

  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dpm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
