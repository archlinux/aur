# Maintainer: c6parmak <can6parmak@gmail.com>
pkgname=alterant
pkgver=26.d9b15e9
pkgrel=1
pkgdesc="A self-contained dotfile manager and lightweight provisioning tool that supports encryption of sensitive data, multiline command execution, and a single file configuration for multiple machines."
arch=('x86' 'x86_64')
url="https://github.com/autonomy/alterant"
license=('unknown')
makedepends=('go')
options=('!strip' '!emptydirs')
_gourl=github.com/autonomy/alterant

pkgver() {
  cd $srcdir/src/$_gourl
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  export GOPATH="$srcdir"
  go get -d $_gourl
}

build() {
  export GOPATH="$srcdir"
  go get $_gourl
}

package() {
  install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:

