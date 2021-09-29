# Maintainer: Tarn W. Burton <twburton@gmail.com>
pkgname=clpm
arch=('x86_64' 'aarch64')
pkgver=0.4.0
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
sha256sums_x86_64=('8b26e4a645a4e9bb5528d5149af7da685e107a4163631843fc23a5f96839697f')
sha256sums_aarch64=('7fa9ed555f4feda3dc3bb39440a014304bde85c908adb44f1c43b6b5e7a93507')

package() {
  if [ $CARCH == 'x86_64' ]; then
    cd "clpm-${_pkgver}-linux-amd64"
  else
    cd "clpm-${_pkgver}-linux-arm64"
  fi
  INSTALL_ROOT=$pkgdir/usr/ sh install.sh
}

