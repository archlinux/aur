# Maintainer:Lucas Eduardo Wendt <lucas59356@gmail.com>

pkgname=sbcli-git
depends=('sbcl' 'quicklisp')
pkgrel=1
pkgver=r26.52f56a5
arch=(any)
pkgdesc="A better REPL for SBCL"
license=("gpl3")
options=(!strip)
url="https://github.com/hellerve/sbcli"
source=("git+https://github.com/hellerve/sbcli")
sha256sums=("SKIP")

# if /usr/bin/env: “sbcl --script”: File or directory not found change hellerve to lucasew on source

pkgver() {
  cd "$srcdir/sbcli"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p "$pkgdir/usr/local/bin"
    cp "$srcdir/sbcli/repl.lisp" "$pkgdir/usr/local/bin/sbcli"
}
