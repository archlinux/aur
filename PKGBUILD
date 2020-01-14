# Maintainer: Mateusz Kaczanowski <kaczanowski.mateusz@gmail.com>

pkgname=epiphany-sdk
pkgver=2016.11
pkgrel=1
pkgdesc='Epiphany SDK'
arch=(armv7h)
url='https://github.com/adapteva/epiphany-sdk'
license=(GPL)
depends=()
options=(!emptydirs !strip staticlibs)
source=(https://github.com/adapteva/epiphany-sdk/releases/download/esdk-$pkgver/esdk.$pkgver.armv7l.tar.gz)
sha256sums=('453525aaaee5565049db6500f418e97616d34d26469a1308ac87c0dcedc3295c')

build() {
    :;
}

package() {
  mkdir -p $pkgdir/opt/adapteva
  cp -r esdk.$pkgver $pkgdir/opt/adapteva/esdk

  echo "=== Update .bashrc (manual) ==="
  echo "EPIPHANY_HOME=/opt/adapteva/esdk"
  echo ". \${EPIPHANY_HOME}/setup.sh"
}
