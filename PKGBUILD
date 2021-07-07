# Maintainer: Tarn W. Burton <twburton@gmail.com>
pkgname=clpm
arch=('x86_64' 'aarch64')
pkgver=0.4.0_alpha.3
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc='Common Lisp Package Manager'
license=('BSD')
url="https://gitlab.common-lisp.net/clpm/clpm"
depends=('sbcl')
provides=('clpm')
source_x86_64=(https://files.clpm.dev/clpm/clpm-${_pkgver}-linux-amd64.tar.gz)
source_aarch64=(https://files.clpm.dev/clpm/clpm-${_pkgver}-linux-arm64.tar.gz)
sha256sums_x86_64=('80b1b0412547d73ecad101720dcba0ec73ee276a2c76f2415e132658e5eecca7')
sha256sums_aarch64=('7bd99d55c83dcc926d74aea23b64a541ac7d9ed86656d64e75fd8314dd450ece')

package() {
  if [ $CARCH == 'x86_64' ]; then
    cd "clpm-${_pkgver}-linux-amd64"
  else
    cd "clpm-${_pkgver}-linux-arm64"
  fi
  INSTALL_ROOT=$pkgdir/usr/ sh install.sh
}

