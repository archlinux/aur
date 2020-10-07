# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=k6-bin
pkgver=0.28.0
pkgrel=1
pkgdesc="A modern load testing tool, using Go and JavaScript (precompiled)"
provides=('k6=0.28.0')
arch=('i686' 'x86_64')
url="https://github.com/loadimpact/k6"
license=('AGPL3')
options=(!emptydirs)
source_i686=("k6.tar.gz::https://github.com/loadimpact/k6/releases/download/v${pkgver}/k6-v${pkgver}-linux32.tar.gz")
source_x86_64=("k6.tar.gz::https://github.com/loadimpact/k6/releases/download/v${pkgver}/k6-v${pkgver}-linux64.tar.gz")
sha256sums_i686=('77d866d63363e894af4bf7972e42bf338f8e56510718c967f70e5283766548cb')
sha256sums_x86_64=('9e4e407b9be64ea2c7ad75fd170d38d5c1d00d80518bb06b35dfca0ad5a0bcd0')

package() {
  if [ "$CARCH" == "x86_64" ]
  then
    bitness=64
  else
    bitness=32
  fi
  install -D $srcdir/k6-v${pkgver}-linux${bitness}/k6 $pkgdir/usr/bin/k6
}
