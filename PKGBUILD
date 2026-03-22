# Maintainer: Sw0ReX <fhsfsaak@gmail.com>
pkgname=duck-git
pkgver=1.1
pkgrel=2
pkgdesc="A simple C program that prints an ASCII duck with many flags and a sudo surprise"
arch=('x86_64' 'aarch64')
url="https://github.com/levvg-gif/duck-git"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make' 'git')
provides=('duck')
conflicts=('duck')
source=("git+${url}.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/duck-git"
  make
}

package() {
  cd "$srcdir/duck-git"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
  
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
