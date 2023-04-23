# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor : Yigit Sever <yigit at yigitsever dot com>
# Contributor :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : mickael9 <mickael9 at gmail dot com>
pkgname=wapiti
pkgver=3.1.7
pkgrel=2
pkgdesc='Comprehensive web app vulnerability scanner written in Python'
arch=('any')
url="https://wapiti-scanner.github.io"
_githuburl="https://github.com/wapiti-scanner/wapiti"
license=('GPL2')
makedepends=('python-setuptools')
depends=('python>=3.9' 'python-cryptography' 'python-soupsieve' 'python-mako' 'python-setuptools' \
  'python-beautifulsoup4' 'python-importlib-metadata' 'python-httpx')
optdepends=('python-requests-kerberos: Kerberos authentication'
            'python-requests-ntlm: NTLM authentication')
options=('zipman')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname}3-${pkgver}.tar.gz")
sha256sums=('8489ddc82fd1cc9ee20861eaecfbaa2edaba46c0d25d3331329ff58bb50dc921')
package() {
  cd "${srcdir}/${pkgname}3-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}