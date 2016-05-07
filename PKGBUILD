pkgname=update-ssh-keys
pkgver=r23.96fe9ef
pkgrel=1
pkgdesc="SSH Key helper binary from github.com/coreos/update-ssh-keys"
arch=('x86_64')
url="https://github.com/coreos/update-ssh-keys"
license=(apache)
makedepends=('go')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$pkgname"
  ./build
}

package() {
  cd "${pkgname}"
  mkdir -p ${pkgdir}/usr/bin
  cp bin/* ${pkgdir}/usr/bin
}

# vim:set ts=2 sw=2 et:
