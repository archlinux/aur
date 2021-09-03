# Maintainer: Gagan Malvi <malvigagan@gmail.com>
pkgname=vitable
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple command-line tool to view your VIT timetable, written in Nim."
arch=('i686' 'x86_64')
url="https://github.com/CartelProject/vitable"
license=('MIT')
depends=(
  'pacman>5'
  'git'
  'nim'
  'nimble'
)
optdepends=(
  'sudo'
)
makedepends=(
  'git'
  'nim'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CartelProject/vitable/archive/${pkgver}.tar.gz")
md5sums=('SKIP')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  make build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/bin"
  install -Dm755 "src/vitable" "${pkgdir}/usr/bin"
}
