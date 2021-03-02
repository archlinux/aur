# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=k6-bin
pkgver=0.30.0
pkgrel=1
pkgdesc="A modern load testing tool, using Go and JavaScript (precompiled)"
provides=('k6=0.30.0')
arch=('i686' 'x86_64')
url="https://github.com/loadimpact/k6"
license=('AGPL3')
options=(!emptydirs)
source_i686=("k6.tar.gz::https://github.com/loadimpact/k6/releases/download/v${pkgver}/k6-v${pkgver}-linux32.tar.gz")
source_x86_64=("k6.tar.gz::https://github.com/loadimpact/k6/releases/download/v${pkgver}/k6-v${pkgver}-linux64.tar.gz")
sha256sums_i686=('b8f37f5df8fe4a5f6fb09184fb5745b0666ec86867389d0a95bce456865bcc61')
sha256sums_x86_64=('db3e300b6c85f129894352ad0955e244f791869bbe0d329a7ecdbb5eb87d4ad2')

package() {
  if [ "$CARCH" == "x86_64" ]
  then
    bitness=64
  else
    bitness=32
  fi
  install -D $srcdir/k6-v${pkgver}-linux${bitness}/k6 $pkgdir/usr/bin/k6
}
