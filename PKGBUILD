# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>

pkgname=extremely-linear-git
_gitname=extremely-linear
pkgver=r62.0000061
pkgrel=1
pkgdesc='Extremely Linear Git History'
url='https://github.com/zegl/extremely-linear'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('lucky-commit')
makedepends=('git')
checkdepends=('bash-bats')
conflicts=('extremely-linear' 'extremely-linear-git')
provides=('extremely-linear')
source=('git+https://github.com/zegl/extremely-linear.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
	:
	# The tests take quite long.
	# cd "$srcdir/$_gitname"
	# bats test/*.bats
}

package() {
	cd "$srcdir/$_gitname"
	install -D "git-linearize" "$pkgdir/usr/bin/git-linearize"
	install -D "shit" "$pkgdir/usr/bin/shit"
}
