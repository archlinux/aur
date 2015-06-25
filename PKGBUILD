# Maintainer: Mikkel Kroman <mk@maero.dk>

pkgname=etcd-ca-git
pkgver=r101.31fef42
pkgrel=1
pkgdesc="A simple certificate manager written in Go. Easy to use with limited capability."
arch=('i686' 'x86_64')
url="https://github.com/coreos/etcd-ca"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("${pkgname}::git+https://github.com/coreos/etcd-ca.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
  ./build
}

package() {
	cd "${srcdir}/${pkgname}"
  install -Dm755 bin/etcd-ca "${pkgdir}/usr/bin/etcd-ca"
}
