pkgname=update-ssh-keys
pkgver=r21.206b3aa
pkgrel=1
pkgdesc="SSH Key helper binary from github.com/coreos/update-ssh-keys"
arch=('x86_64')
url="https://github.com/coreos/update-ssh-keys"
license=(apache)
makedepends=('go')
provides=('update-ssh-keys')
replaces=('update-ssh-keys')
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
