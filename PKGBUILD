# Maintainer: Brainfuck <brainfucksec@protonmail.com>

pkgname=archtorify
pkgver=1.19.4
pkgrel=1
pkgdesc="Transparent proxy through Tor for Arch Linux"
arch=('any')
url="https://github.com/brainfucksec/archtorify"
license=('GPL3')
makedepends=('git')
source=("git+https://github.com/brainfucksec/${pkgname}/")
md5sums=('SKIP')

package() {
    depends=('tor')

    cd "$pkgname"

	install -Dm644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
	install -Dm755 archtorify.sh $pkgdir/usr/bin/archtorify
    mkdir -p $pkgdir/usr/share/$pkgname/data
    mkdir -p $pkgdir/usr/share/$pkgname/backups
    install -Dm644 data/* $pkgdir/usr/share/$pkgname/data
}

# vim:set ts=2 sw=2
