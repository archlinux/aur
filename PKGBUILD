# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor : Yigit Sever <yigit at yigitsever dot com>
# Contributor : Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : mickael9 <mickael9 at gmail dot com>
pkgname=wapiti
pkgver=3.1.8
pkgrel=1
pkgdesc='Comprehensive web app vulnerability scanner written in Python'
arch=('any')
url="https://wapiti-scanner.github.io"
_ghurl="https://github.com/wapiti-scanner/wapiti"
license=('GPL-2.0-only')
depends=(
  'python>=3.9'
  'python-cryptography'
  'python-soupsieve'
  'python-mako'
  'python-setuptools'
  'python-beautifulsoup4'
  'python-httpx'
)
makedepends=(
  'python-setuptools'
  'git'
)
optdepends=(
  'python-requests-kerberos: Kerberos authentication'
  'python-requests-ntlm: NTLM authentication'
)
options=(
  'zipman'
)
source=(
  "${pkgname}.git::git+${_ghurl}.git#tag=${pkgver}"
)
sha256sums=('SKIP')
package() {
    cd "${srcdir}/${pkgname}.git"
    # Use pip to install the package into the pkg directory
    python -m pip install . --no-deps --ignore-installed --no-warn-script-location \
        --prefix=/usr --root="${pkgdir}"
}