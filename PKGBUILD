# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor : Yigit Sever <yigit at yigitsever dot com>
# Contributor : Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : mickael9 <mickael9 at gmail dot com>
pkgname=wapiti
pkgver=3.2.4
pkgrel=2
pkgdesc='Comprehensive web app vulnerability scanner written in Python'
arch=('any')
url="https://wapiti-scanner.github.io"
_ghurl="https://github.com/wapiti-scanner/wapiti"
license=('GPL-2.0-only')
depends=(
  'python-cryptography'
  'python-soupsieve'
  'python-mako'
  'python-setuptools'
  'python-beautifulsoup4'
  'python-httpx'
  'python-aiocache'
  'python-sqlalchemy'
  'python-browser-cookie3'
  'python-tld'
  'python-loguru'
  'python-yaswfp'
  'mitmproxy'
  'python-arsenic'
  'python-prance'
  'python-httpx-ntlm'
)
makedepends=(
  'python-setuptools'
  'python-pip'
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
  "${pkgname}-${pkgver}::git+${_ghurl}#tag=${pkgver}"
)
sha256sums=('bb3b7d092fbc06dc2ca095ae04c6b91963288199bef1b0b487275b27bc91f77a')
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Use pip to install the package into the pkg directory
    python -m pip install . \
      --no-deps \
      --ignore-installed \
      --no-warn-script-location \
      --prefix=/usr --root="${pkgdir}"
}