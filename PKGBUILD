# Maintainer: kpcyrd <git@rxv.cc>

_gitname=gitoops
pkgname=gitoops-git
pkgver=0.0.0.r33
pkgrel=2
pkgdesc="Identify lateral movement and privilege escalation paths in CI/CD environments"
url="https://github.com/ovotech/gitoops"
makedepends=('go')
provides=('gitoops')
conflicts=('gitoops')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('MIT')
source=("git+https://github.com/ovotech/${_gitname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo 0.0.0.r$(git rev-list HEAD --count)
}

build() {
  cd "${_gitname}"
  go build -o gitoops ./cmd/
}

package() {
  cd "${_gitname}"
  install -Dm755 gitoops -t "${pkgdir}/usr/bin"
  install -Dm644 README.md docs/* \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
