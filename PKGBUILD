# Maintainer: Erick Pires pires@erickpires.com
pkgname=pfsshell-git
pkgver=28.dce247e
pkgrel=1
pkgdesc="Browse and edit PFS filesystems."
arch=("i686" "x86_64")
url="https://github.com/uyjulian/pfsshell"
license=('')
makedepends=('git' 'clang' 'gcc' 'make')
source=('pfsshell-git::git+https://github.com/erickpires/pfsshell.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname}"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname}"
    make
}

package() {
    cd "$srcdir/${pkgname}"
    install -Dm755 pfsshell "$pkgdir/usr/bin/pfsshell"
}
