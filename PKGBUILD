# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=verticalize-git
pkgver=r7.903975a
pkgrel=1
pkgdesc="Simple tool to verticalize text delimited files."
arch=('i686' 'x86_64')
url="https://github.com/lindenb/verticalize"
license=('MIT')
depends=('')
provides=('verticalize')
conflicts=('verticalize')
source=(git+https://github.com/lindenb/verticalize.git)
md5sums=('SKIP')

pkgver() {
  cd "${pkgname//-git/}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"/"${pkgname}"

  make
}

package() {
  mkdir -p "${pkgdir}"/usr/bin/

  cp "${srcdir}"/"${pkgname}"/verticalize "${pkgdir}"/usr/bin/verticalize
}
