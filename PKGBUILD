# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=vncpwd
pkgname=${_pkgname}-git
pkgver=0.1.r0.g58d585c
pkgrel=1
pkgdesc="VNC Password Decrypter"
arch=('x86_64')
url="https://github.com/jeroennijhof/vncpwd"
license=('GPL3')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's|v||;s|-|.r|;s|-|.|'
}

build() {
  cd "${pkgname%-git}"
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
}
