# Maintainer: Ted Meyer <tmathmeyer@gmail.com>

_pkgname=psg
pkgname=${_pkgname}
pkgver=2
pkgrel=1
pkgdesc='C program for generating powerline PS1s for bash'
arch=('x86_64')
url="https://github.com/tmathmeyer/${_pkgname}"
license=('GPL')
depends=()
makedepends=('git')
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/tmathmeyer/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_pkgname/"
    make
}

package() {
    installDir="$pkgdir/usr/bin"
    install -dm755 "$installDir"
    install -m755 "$srcdir/$_pkgname/psg" "$installDir/psg"
}
