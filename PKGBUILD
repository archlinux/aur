# Maintainer: Otto Ahoniemi <otto@ottoahoniemi.fi>

pkgname=kanttiinit-git
dest=cli
pkgver=v0.0.3.r13.g7600b66
pkgrel=1
pkgdesc="Command-line interface for Kanttiinit, a Finnish student restaurant
menu tool (git)"
arch=('any')
url="https://github.com/Kanttiinit/cli"
makedepends=('gcc' 'make')
source=(git+$url)
md5sums=('SKIP')

build() {
    cd $dest
    make
}

pkgver() {
  cd $dest
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd $dest
    install -D kanttiinit -t "$pkgdir"/usr/bin
}
