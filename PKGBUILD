# Maintainer: Tarn W. Burton <twburton@gmail.com>
pkgname=clpm
arch=('x86_64' 'aarch64')
pkgver=0.4.1
_pkgver=${pkgver//_/-}
pkgrel=2
pkgdesc='Common Lisp Project Manager'
license=('BSD')
url="https://gitlab.common-lisp.net/clpm/clpm"
depends=('sbcl')
options+=(!strip)
provides=('clpm')
source_x86_64=(https://files.clpm.dev/clpm/clpm-${_pkgver}-linux-amd64.tar.gz)
source_aarch64=(https://files.clpm.dev/clpm/clpm-${_pkgver}-linux-arm64.tar.gz)
sha256sums_x86_64=('39cb907d4b1099e458cf8227d6eff23dc54a03b635f7e0b69a46e3a93f2b24dc')
sha256sums_aarch64=('b4821364ee1ecca8b943ce8808e08c25b8b501ad5e1eb2e4d4d39096aad95383')

package() {
  if [ $CARCH == 'x86_64' ]; then
    cd "clpm-${_pkgver}-linux-amd64"
  else
    cd "clpm-${_pkgver}-linux-arm64"
  fi
  INSTALL_ROOT=$pkgdir/usr/ sh install.sh
}

