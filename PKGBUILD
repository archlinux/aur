# Maintainer: Brainfuck
# https://github.com/brainfucksec

_gitname=archtorify
pkgname=archtorify-git
pkgver=1.10.1
pkgrel=5
pkgdesc="Transparent proxy through Tor for Arch Linux"
arch=('any')
url="https://github.com/brainfucksec/archtorify/"
license=('GPL3')
depends=('tor')
makedepends=('git')
source=("git+https://github.com/brainfucksec/${_gitname}/")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --always | sed 's|-|.|g'
}

package() {
	cd "$_gitname"

	install -Dm644 README.md $pkgdir/usr/share/doc/$_gitname/README.md
	install -Dm755 archtorify.sh $pkgdir/usr/bin/archtorify
	mkdir -p $pkgdir/opt/$_gitname/backups
    cp -R cfg $pkgdir/opt/$_gitname/cfg
}

# vim:set ts=2 sw=2
