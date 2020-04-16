# Maintainer: Artur Juraszek <artur@juraszek.xyz>

pkgname=dolt-bin
pkgver=0.15.2
pkgrel=3
pkgdesc='Like Git, but for data'
arch=('i686' 'x86_64')
url='https://www.dolthub.com/'
license=('Apache')
conflicts=('dolt')
source_i686=("$pkgname-i686-$pkgver.tar.gz::https://github.com/liquidata-inc/dolt/releases/download/v$pkgver/dolt-linux-386.tar.gz")
source_x86_64=("$pkgname-x86_64-$pkgver.tar.gz::https://github.com/liquidata-inc/dolt/releases/download/v$pkgver/dolt-linux-amd64.tar.gz")
sha256sums_i686=('38c73d5eddcde207290e642f6f5deb5f11e3fc2ba812a0a8fd7b240bfd51da63')
sha256sums_x86_64=('a9ee2c57f426d0c8ea6987b8c90bfd333770d9d76da8c48b71eb9d3c4198a1f7')

package() {
  if [ $CARCH == 'x86_64' ]; then
      cd dolt-linux-amd64
  else
      cd dolt-linux-386
  fi
  install -D -t $pkgdir/usr/bin/ bin/{dolt,git-dolt,git-dolt-smudge}
}
