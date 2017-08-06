# Maintainer: Jack Liu <jackxuanliu@gmail.com>
pkgname=java-jnumbernamer-git
pkgver=r5.22fb83d
pkgrel=1
pkgdesc="A command-line utility to name arbitrarily sized numbers using the Conway-Wechsler system"
arch=('i686' 'x86_64')
url="https://github.com/jackxuanliu/java-jnumbernamer"
license=('LGPL3')
depends=('java-runtime')
makedepends=('git' 'java-environment')
source=("git+https://github.com/jackxuanliu/java-jnumbernamer.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/java-jnumbernamer"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/java-jnumbernamer"
  ./build.sh
}

package() {
  cd "$srcdir/java-jnumbernamer"

  install -d "$pkgdir/usr/share/java/jnumbernamer"
  install -d "$pkgdir/usr/bin/"
  install -m644 build/jnumbernamer.jar "$pkgdir/usr/share/java/jnumbernamer"
  install -m755 res/java-jnumbernamer "$pkgdir/usr/bin/"
}
