pkgname=update-ssh-keys
pkgver=0.0.1
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
  git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
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
