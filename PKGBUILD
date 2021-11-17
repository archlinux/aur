# Maintainer: lucemans

pkgname=ltools
_binname=lt
pkgver=v0.0.1.r0.gb4bccf4
pkgrel=1
pkgdesc='LTools'
arch=('x86_64' 'aarch64')
url='https://github.com/lucemans/ltools'
license=('MIT')
makedepends=('cargo' 'git')
sha512sums=('SKIP')
source=("git+https://github.com/lucemans/$pkgname.git")

pkgver() {
  cd $pkgname

  echo $(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
}

build() {
  cd $pkgname

  cargo build --release
}

package() {
  cd $pkgname

  install -Dm 755 "target/release/$_binname" "$pkgdir/usr/bin/$_binname"
}
