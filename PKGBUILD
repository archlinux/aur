# Maintainer: Tarn W. Burton <twburton@gmail.com>
pkgname=clpm
arch=('x86_64' 'aarch64')
pkgver=0.4.0_rc.1
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc='Common Lisp Package Manager'
license=('BSD')
url="https://gitlab.common-lisp.net/clpm/clpm"
depends=('sbcl')
options+=(!strip)
provides=('clpm')
source_x86_64=(https://files.clpm.dev/clpm/clpm-${_pkgver}-linux-amd64.tar.gz)
source_aarch64=(https://files.clpm.dev/clpm/clpm-${_pkgver}-linux-arm64.tar.gz)
sha256sums_x86_64=('ec2f4630a510bcdbe5d08a50bea15d6ec653b37740eff335ac4141db161a6aad')
sha256sums_aarch64=('ca25aa886697b24787c275c14537a2b4dd17d0f4a0ab90627729605f79369832')

package() {
  if [ $CARCH == 'x86_64' ]; then
    cd "clpm-${_pkgver}-linux-amd64"
  else
    cd "clpm-${_pkgver}-linux-arm64"
  fi
  INSTALL_ROOT=$pkgdir/usr/ sh install.sh
}

