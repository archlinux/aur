# Maintainer: Sebastian Neef <aur AT gehaxelt DOT IN>
pkgbase=wordlist-git
pkgname=wordlist-git
pkgver=r90.6ec5142
pkgrel=1
pkgdesc="Generates all possible permutations of a given charset."
arch=('any')
url="https://github.com/rexos/wordlist"
license=('GPL3')
depends=('python')
makedepends=('git' 'bash')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("$pkgname::git+https://github.com/rexos/wordlist.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1
}
