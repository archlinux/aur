pkgname=gut-git
pkgver=0.3.0.r4.g83bd2e3
pkgrel=1
pkgdesc="An alternative git CLI for Windows, macOS, and Linux"
arch=(any)
url="https://gut-cli.dev"
license=("MIT")
makedepends=("go")
source=("git+https://github.com/julien040/gut")
sha256sums=("SKIP")

pkgver() {
  cd gut
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd gut
  go build
}

package() {
  install -Dm755 "${srcdir}/gut/gut" "${pkgdir}/usr/bin/gut"
}
