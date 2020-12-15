# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=k6-bin
pkgver=0.29.0
pkgrel=1
pkgdesc="A modern load testing tool, using Go and JavaScript (precompiled)"
provides=('k6=0.29.0')
arch=('i686' 'x86_64')
url="https://github.com/loadimpact/k6"
license=('AGPL3')
options=(!emptydirs)
source_i686=("k6.tar.gz::https://github.com/loadimpact/k6/releases/download/v${pkgver}/k6-v${pkgver}-linux32.tar.gz")
source_x86_64=("k6.tar.gz::https://github.com/loadimpact/k6/releases/download/v${pkgver}/k6-v${pkgver}-linux64.tar.gz")
sha256sums_i686=('ad1c1126f573bc59c4a905e4ca944ae202bf83d02c704506a827a287665bdc47')
sha256sums_x86_64=('3aecad208aabfaeea895d3c86ed7d4882e3fa2076079cc065a99ac56d0fb96d5')

package() {
  if [ "$CARCH" == "x86_64" ]
  then
    bitness=64
  else
    bitness=32
  fi
  install -D $srcdir/k6-v${pkgver}-linux${bitness}/k6 $pkgdir/usr/bin/k6
}
