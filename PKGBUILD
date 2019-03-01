# Maintainer: Justin Howard <jmhoward0@gmail.com>

pkgname=csvquote-git
pkgver=0.r52.baf37fa
pkgrel=1
pkgdesc="smart and simple CSV processing on the command line"
arch=('i686' 'x86_64')
url="https://github.com/dbro/csvquote"
license=('MIT')
depends=()
makedepends=('git')
conflicts=('csvquote')
provides=('csvquote')
source=("${pkgname}::git+https://github.com/dbro/csvquote.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"

  mkdir -p "${pkgdir}/usr/bin"
  make BINDIR="${pkgdir}/usr/bin" install
  install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
