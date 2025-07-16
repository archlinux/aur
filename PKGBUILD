# Maintainer: Minecodes <contact at mcds.moe>
pkgname=shortcuts-bin
_pkgname=shortcuts
pkgver=v2.0.0
pkgrel=5
groups=('mcds')
pkgdesc="A tool for getting shortcuts & commands for commands"
arch=('x86_64' 'aarch64' 'armv7h' 'i686' 'riscv64')
url="https://codeberg.org/Minecodes/shortcuts"
license=('bsd-4-clause')
makedepends=('go' 'git')
source=("git+https://codeberg.org/Minecodes/shortcuts.git")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  go build -trimpath -ldflags "-w -X main.version=${pkgver}" -o shortcuts ./cmd/shortcuts.go
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 shortcuts -t "${pkgdir}/usr/bin"
}
