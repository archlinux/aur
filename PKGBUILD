# Maintainer: Brainfuck <brainfucksec@protonmail.com>

pkgname=archtorify-git
_pkgname=archtorify
pkgver=v1.30.1
pkgrel=2
pkgdesc="Transparent proxy through Tor for Arch Linux"
arch=('any')
url="https://github.com/brainfucksec/archtorify/"
license=('GPL3')
depends=('tor')
makedepends=('git')
source=("git+https://github.com/brainfucksec/${_pkgname}/")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$_pkgname"

    install -Dm644 README.md $pkgdir/usr/share/doc/$_pkgname/README.md
    install -Dm755 archtorify.sh $pkgdir/usr/bin/archtorify

    mkdir -p $pkgdir/usr/share/$_pkgname/data
    mkdir -p $pkgdir/var/lib/$_pkgname/backups

    install -Dm644 data/* $pkgdir/usr/share/$_pkgname/data
}

# vim:set ts=4 sw=4
