# Maintainer: intervinn <typevsc@gmail.com>

pkgname=ligen-git
_pkgname=${pkgname%-git}
pkgver=1.0.0
pkgrel=1
pkgdesc='A simple CLI tool to inject LICENSE headers into your code '
arch=('x86_64' 'aarch64' 'arm64')
url='https://github.com/shabman/ligen'
license=('GPL-3.0')
makedepends=('git' 'make' 'gcc')
depends=('gcc-libs' 'glibc')
sha512sums=('SKIP')
source=("git+$url.git")

build() {
  cd "$_pkgname"

  make all
}

package() {
  cd "$_pkgname"
  install -Dm 755 build/main "$pkgdir"/usr/bin/"$_pkgname"
}
