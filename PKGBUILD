pkgname=nfactorial-git
pkgver=1.0
pkgrel=1
pkgdesc="A factorial calculator i guess."
arch=('x86_64' 'aarch64')
url="https://github.com/mrgamernavshorts/nfactorial"
license=('MIT')
depends=('glibc')
makedepends=('git' 'make' 'clang')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  make nfactorial
}

package() {
  cd "${pkgname}"
  install -Dm755 nfactorial "${pkgdir}/usr/bin/nfactorial"
}
