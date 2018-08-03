# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=verticalize-git
pkgver=r9.57f8c91
pkgrel=1
pkgdesc="Simple tool to verticalize text delimited files."
arch=('i686' 'x86_64')
url="https://github.com/lindenb/verticalize"
license=('MIT')
provides=('verticalize')
conflicts=('verticalize')
source=(git+https://github.com/lindenb/verticalize.git)
md5sums=('SKIP')

pkgver() {
  cd "${pkgname//-git/}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"/"${pkgname//-git/}"

  make
}

package() {
  mkdir -p "${pkgdir}"/usr/bin/

  cp "${srcdir}"/"${pkgname//-git/}"/verticalize "${pkgdir}"/usr/bin/verticalize
}
