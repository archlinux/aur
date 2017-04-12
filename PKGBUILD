# Maintainer: Brainfuck
# http://github.com/brainfucksec

_gitname=archtorify
pkgname=archtorify-git
pkgver=1.8.3
pkgrel=1
pkgdesc="Program for simplify the configuration of transparent proxy trough Tor Network"
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
}

# vim:set ts=2 sw=2
