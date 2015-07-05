# Maintainer: Tommaso Sardelli <lacapannadelloziotom [at] gmail [dot] com>

_pkgname=bashmarks
pkgname=${_pkgname}-git
pkgver=43
pkgrel=2
pkgdesc='A shell script that allows you to save and jump to commonly used directories'
arch=('any')
url="https://github.com/huyng/${_pkgname}"
license=('BSD')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=("$pkgname.install")
source=("git://github.com/huyng/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm644 bashmarks.sh $pkgdir/usr/share/$_pkgname/${_pkgname}.sh
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
