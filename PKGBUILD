# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=k6-bin
pkgver=0.26.2
pkgrel=1
pkgdesc="A modern load testing tool, using Go and JavaScript (precompiled)"
provides=('k6=0.26.2')
arch=('i686' 'x86_64')
url="https://github.com/loadimpact/k6"
license=('AGPL3')
options=(!emptydirs)
source_i686=("k6.tar.gz::https://github.com/loadimpact/k6/releases/download/v${pkgver}/k6-v${pkgver}-linux32.tar.gz")
source_x86_64=("k6.tar.gz::https://github.com/loadimpact/k6/releases/download/v${pkgver}/k6-v${pkgver}-linux64.tar.gz")
sha256sums_i686=('1433416aa4db37900705263a7987213ba8a3cca41c09e37300422c3f37a5cced')
sha256sums_x86_64=('db7c009aa09c7cf990759191d550a268f5e644c7135e38bae7d7ba395ff38f59')

package() {
  if [ "$CARCH" == "x86_64" ]
  then
    bitness=64
  else
    bitness=32
  fi
  install -D $srcdir/k6-v${pkgver}-linux${bitness}/k6 $pkgdir/usr/bin/k6
}
