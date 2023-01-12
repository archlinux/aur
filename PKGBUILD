# Maintainer: Mikescher <aur@mikescher.com>
# Repo:       https://github.com/Mikescher/better-docker-ps

pkgname=dops-git
pkgver=1.7
pkgrel=1

pkgdesc="A replacement for the default docker-ps that tries really hard to fit into the width of your terminal."

url="https://github.com/Mikescher/better-docker-ps"
license=('Apache')

makedepends=('go' 'git')

arch=('any')

source=("$pkgname::git+https://github.com/Mikescher/better-docker-ps")

sha256sums=('SKIP')

build() {
  cd "$pkgname"
  go build -o dops  cmd/dops/main.go
}

package()
{
  install -D -m755 "$pkgname/dops" "${pkgdir}/usr/bin/dops"
}

