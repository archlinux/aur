# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=tvsm-git
pkgver=r306.64c0f52
pkgrel=1
pkgdesc='A simple command-line TV show manager'
arch=('x86_64')
url='https://github.com/TonCherAmi/tvsm'
license=('LGPL3')
conflicts=('tvsm-git')
options=('!strip')
depends=('guile')
source=("${pkgname%-git}::git+https://github.com/TonCherAmi/tvsm")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"  
}

build() {
  cd "${pkgname%-git}"
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et: