# Maintainer: Pavle Portic <archlinux@theedgeofrage.com>

pkgname=zeitgeist-dependencies-git
name=zeitgeist
pkgver=0.3.0.r426.gd2b7e91
pkgrel=1
pkgdesc='The language-agnostic dependency checker'
arch=('x86_64')
url='https://github.com/kubernetes-sigs/zeitgeist'
license=('Apache')
makedepends=('go' 'git' 'make')
source=("$pkgname"::git+https://github.com/kubernetes-sigs/zeitgeist)
sha256sums=('SKIP')
conflicts=("zeitgeist-dependencies")
options=(!lto)

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    make build
}

package() {
    cd "$pkgname"
    install -Dm755 "$name" "$pkgdir"/usr/bin/"$name"
}
