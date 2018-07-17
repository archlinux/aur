# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>
pkgname=ss7calc-git
pkgver=r37.24b0ece
pkgrel=1
pkgdesc="SS7 Signaling Point Code calculator"
url="https://github.com/philpraxis/ss7calc"
depends=('python')
license=("eGPL")
arch=('any')
makedepends=('git')
source=('ss7calc::git+https://github.com/philpraxis/ss7calc#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/ss7calc/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "${srcdir}/ss7calc/ss7calc.py" "${pkgdir}/usr/bin/ss7calc"
}
