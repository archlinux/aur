# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=git-related
pkgver=r29.0d8db5e
pkgrel=1
pkgdesc='Find related people and commits on a set of changes'
arch=('any')
url="https://github.com/felipec/git-related"
source=("git+$url")
md5sums=('SKIP')
makedepends=('asciidoc')

pkgver() {
  cd "${srcdir}/git-related"
  git describe --tags --abbrev=10 HEAD |
    sed 's/^v//; s/-/+/; s/-/./'
}

build() {
  cd "${srcdir}/git-related"
  make doc/git-related.1
}

package() {
  install -Dm755 "${srcdir}/git-related/git-related"       "${pkgdir}/usr/bin/git-related"
  install -Dm755 "${srcdir}/git-related/doc/git-related.1" "${pkgdir}/usr/share/man/man1/git-related.1"
}
