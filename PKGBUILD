# Maintainer: Miguel Palencia <mike@qtum.org>

pkgname=solar-git
pkgver=20190721
pkgrel=1
pkgdesc="Smart Contracts deployment tool"
arch=('x86_64')
depends=('solidity')
makedepends=('go' 'make')

url="https://github.com/qtumproject/solar"
license=('MIT')
source=(git+https://github.com/qtumproject/solar)
sha256sums=('SKIP')
provides=('solar')
conflicts=('solar')


pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}
  make
  echo 'Building...'
 
}

package() {
  cd ${pkgname%-git}
 install -Dm755 solar "$pkgdir/usr/bin/solar"
}

