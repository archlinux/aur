# Maintainer: Manoel Vilela <manoel_vilela@engineer.com>

pkgname="brain"
pkgver="1.0"
pkgrel=1
pkgdesc="Official compiler of Brain Language"
arch=('i686' 'x86_64')
url="https://github.com/brain-labs/brain"
license=('GPL3')
groups=()
depends=()
makedepends=("gcc" "llvm-libs" "llvm")
optdepends=()
provides=('brain')
conflicts=('brain')
replaces=('brain')
backup=()
options=()
install="$pkgname.install"
changelog="CHANGELOG"
source=("https://github.com/brain-labs/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
md5sums=("9665fc9ef1147d1ca394e232d468176d") #autofill using updpkgsums

build() {
  cd "$pkgname-$pkgver"

  make build-gcc
}

package() {
  cd "$pkgname-$pkgver"

  sudo cp bin/brain /usr/bin/brain
}