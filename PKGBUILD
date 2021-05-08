# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=k6-bin
pkgver=0.31.1
pkgrel=1
pkgdesc="A modern load testing tool, using Go and JavaScript (precompiled)"
provides=('k6=0.31.1')
arch=('i686' 'x86_64')
url="https://github.com/loadimpact/k6"
license=('AGPL3')
options=(!emptydirs)
source_i686=("k6.tar.gz::https://github.com/loadimpact/k6/releases/download/v${pkgver}/k6-v${pkgver}-linux32.tar.gz")
source_x86_64=("k6.tar.gz::https://github.com/loadimpact/k6/releases/download/v${pkgver}/k6-v${pkgver}-linux64.tar.gz")
sha256sums_i686=('ddaf1fe46374e5e97328b08747d9b3856a0659f16b1b5e250c58ebf38deecb24')
sha256sums_x86_64=('ee2ce2d1b9ceae521ee8877b76b42e5351031b42348613818f764e96650ea509')

package() {
  if [ "$CARCH" == "x86_64" ]
  then
    bitness=64
  else
    bitness=32
  fi
  install -D $srcdir/k6-v${pkgver}-linux${bitness}/k6 $pkgdir/usr/bin/k6
}
