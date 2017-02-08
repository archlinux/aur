# Maintainer: Kieran Colford <kieran@kcolford.com>
pkgname=pacman-cycles-git
pkgver=1.0.0.r0.g116d2cd
pkgrel=1
pkgdesc="A script to print out installed packages that are part of a dependency cycle."
arch=('any')
url="https://github.com/kcolford/pacman-cycles"
license=('GPL')
groups=()
depends=('bash' 'pacman')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("git+$url")
md5sums=('SKIP')
noextract=()

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long | sed 's/v//;s/-/.r/;s/-/./g;'
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 pacman-cycles "$pkgdir/usr/bin/pacman-cycles"
}
