pkgname=binspam-git
pkgver=0
pkgrel=1
pkgdesc="Spam random 1s and 0s"
arch=('x86_64')
url="https://github.com/Szerwigi1410/binspam"
license=('MIT')
depends=('iostem-git')
makedepends=('git' 'gcc')

source=("git+https://github.com/Szerwigi1410/binspam.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/binspam"
  git describe --long --tags --always
}

build() {
  cd "$srcdir/binspam"
  g++ -I/usr/include main.cpp -o binspam
}

package() {
  cd "$srcdir/binspam"
  install -Dm755 binspam "$pkgdir/usr/bin/binspam"
}
