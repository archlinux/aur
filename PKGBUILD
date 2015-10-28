# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>
_pkgname='N1'
pkgname='n1-git'
pkgver=..0edbf51
pkgrel=1
pkgdesc="An extensible mail client built on the modern web"
arch=('any')
url="https://github.com/mbilker/N1/tree/node-v4"
license=('')
depends=('nodejs' 'npm')
makedepends=('git')
optdepends=()
provides=('n1')
conflicts=('n1')
install=
source=('git+https://github.com/mbilker/N1.git')
noextract=()
sha512sums=('SKIP') 

pkgver() {
  cd $_pkgname
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  ./script/bootstrap

}

package() {
  mkdir "${pkgdir}/opt/"
  cp -r "${srcdir}/$_pkgname" "${pkgdir}/opt/"
}
