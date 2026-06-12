# Maintainer: Abdur Rehman Imran <arehmanimran4@gmail.com>
pkgname=pacx
pkgver=0.1.0
pkgrel=1
pkgdesc="A Simple Pacman Wrapper inspired by Powerpill and Nala"
arch=('x86_64')
url="https://github.com/abdurehmanimran/pacx"
license=('GPL-2.0')
makedeps=('base-devel')
provides=('pacx')
source=(git+'https://github.com/abdurehmanimran/pacx.git')
md5sums=('SKIP')

build() {
  cd "$pkgname"
  make build-release
}

package() {
  cd "$pkgname"
  mkdir "$pkgdir/usr/bin/" -p
  mkdir "$pkgdir/usr/share/pacx/cache" -p
  install -D "bin/release/pacx" "$pkgdir/usr/bin/"
}
