# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=('python-whois' 'python2-whois')
pkgver=0.7.1
pkgrel=1
pkgdesc="Whois querying and parsing of domain registration information"
arch=( 'i686' 'x86_64' )
url="https://bitbucket.org/richardpenman/pywhois"
license=( 'CUSTOM' )
depends=( 'python' 'python2' )
makedepends=( 'python' 'python2' 'python-setuptools' 'python2-setuptools' )
_pkgname=python-whois
install=
changelog=
noextract=()
source=("https://files.pythonhosted.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
	"LICENSE"
        "${_pkgname}-${pkgver}.tar.gz.sig"
	"LICENSE.sig")
sha512sums=('b5954b92c72fa03a8dab01cddae85a7f964cca3f72820788140e75c8702ead7884ebefdaf95c50efd2992efc7966c287a5ea66220b44348827d35d62bd9b4494'
	    '8cf4065e880c751354fffe41f513b95c6bad6bd28033d7a660bd52636cae0c313f9b60f4c53234320699fc0b44d9e4b42bb06f543733b41e0de07a68068099d1'
	    'SKIP'
            'SKIP')

package_python-whois() {
  depends=('python' 'python-future')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm 0644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-whois() {
  depends=('python2' 'python2-futures')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm 0644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
