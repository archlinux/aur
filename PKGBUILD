# Maintainer: Holger Heinz
pkgname=stu-git
pkgver=2.5.80
pkgrel=1
pkgdesc="A build automation tool with support for parametrized rules and dynamic dependencies"
arch=('i686' 'x86_64')
url='https://github.com/kunegis/stu'
license=('GPL3')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'gcc' 'make')
provides=('stu')
conflicts=()
source=("git+https://github.com/kunegis/stu")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}" && head -n1 VERSION
}

build() {
  cd "$srcdir/${pkgname%-git}" && ./configure --prefix=/usr && make
}

package() {
  cd "$srcdir/${pkgname%-git}" && make DESTDIR="$pkgdir/" install
}

