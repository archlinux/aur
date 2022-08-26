# Maintainer: Elmar <aur@ramle.be>
_pkgname=crtsh
pkgname=$_pkgname-git
pkgver=df40d0a
pkgrel=1

pkgdesc="This tool shows the result of crt.sh"
url="https://github.com/famasoon/$_pkgname.git"
arch=("any")
license=("none")
makedepends=("git" "go")
conflicts=("$_pkgname")
provides=("$_pkgname=${pkgver}")

source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --always
}

build() {
  cd $_pkgname
  go build
}

package() {
  install -Dm755 $_pkgname/crtsh -t "${pkgdir}/usr/bin"
}
