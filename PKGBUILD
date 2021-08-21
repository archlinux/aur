 
# Maintainer: Librewish <librewish@gmail.com>
pkgname=find-the-command-git
_pkgname=find-the-command
pkgver=1.4.2.r2.g0fc7e85
pkgrel=1
pkgdesc="Advanced command-not-found hook for bash , fish and zsh using the power of pacman"
arch=('any')
url="https://github.com/agura-lex/$_pkgname.git"
license=('custom:WTFPL')
depends=('pacman')
optdepends=('bash: for bash support'
            'fish: for fish support'
            'zsh: for zsh support')
install=find-the-command.install
options=('docs')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$_pkgname"
	rm .gitignore
	mkdir -p usr/share/licenses/$_pkgname
	mv LICENSE usr/share/licenses/$_pkgname/
	mv README.md usr/share/doc/$_pkgname/
	cp -a * $pkgdir/
}
