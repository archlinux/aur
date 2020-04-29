# Maintainer: Artur Juraszek <artur@juraszek.xyz>

pkgname=dolt-bin
pkgver=0.16.0
pkgrel=2
pkgdesc='Git for data!'
arch=('i686' 'x86_64')
url='https://www.dolthub.com/'
license=('Apache')
conflicts=('dolt')
source_i686=("$pkgname-i686-$pkgver.tar.gz::https://github.com/liquidata-inc/dolt/releases/download/v$pkgver/dolt-linux-386.tar.gz")
source_x86_64=("$pkgname-x86_64-$pkgver.tar.gz::https://github.com/liquidata-inc/dolt/releases/download/v$pkgver/dolt-linux-amd64.tar.gz")
sha256sums_i686=('b1563784a8776083be85930eca5918aa5e22154ab0aab70abcaa8c29dcb566e3')
sha256sums_x86_64=('e7b49e99207794972321302bae4d00424ca6221adc8d6443b6d6dd11f976bd8b')

package() {
  if [ $CARCH == 'x86_64' ]; then
      cd dolt-linux-amd64
  else
      cd dolt-linux-386
  fi
  install -D -t $pkgdir/usr/bin/ bin/{dolt,git-dolt,git-dolt-smudge}
}
