# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Ole Ernst <olebowle[at]gmx[dot]com>
pkgname=irctl
pkgver=0.1.1
pkgrel=1
pkgdesc="Command-line utilty to query and set properties of common remote control receivers"
url="https://github.com/olebowle/irctl"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL3')
depends=('gcc-libs' 'glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/olebowle/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('994f3b0e0423afde8c87b522641e02a7')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX='/usr' install
}
