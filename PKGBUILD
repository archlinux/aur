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
checkdepends=('bats')
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
	install -Dm644 "git-linearize" "$pkgdir/usr/bin/git-linearize"
	install -Dm644 "shit" "$pkgdir/usr/bin/shit"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$_gitname/LICENSE"
}
