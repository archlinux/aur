# Contributor: Niclas Meyer <niclas at countingsort dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=literate-git
pkgver=r340.6a9a3af
pkgrel=1
pkgdesc="A literate programming tool for any language"
arch=('i686' 'x86_64')
url="https://github.com/zyedidia/Literate"
license=('MIT')
makedepends=('git' 'dmd' 'dub')
conflicts=('literate')
provides=('literate')
source=("${pkgname}::git+https://github.com/zyedidia/Literate.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  make
}

package() {
  install -Dm755 "${srcdir}/${pkgname}/bin/lit" "${pkgdir}/usr/bin/lit"
}
