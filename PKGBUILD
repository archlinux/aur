# Maintainer: Caleb Fontenot <foley2431 at gmail dot com>
pkgname=packwiz-git
pkgver=f2c6b89
url="https://github.com/comp500/packwiz"
pkgrel=1
pkgdesc="A command line tool for creating minecraft modpacks."
arch=('any')
license=('MIT')
depends=('go')
source=("git+https://github.com/comp500/packwiz.git")
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/packwiz"
        #git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
        git rev-parse --short HEAD
}

build() {
        cd "$srcdir/packwiz"
        go build
}

package() {
        cd "$srcdir/packwiz"
        install -Dm755 packwiz "${pkgdir}/usr/bin/packwiz"

    }
