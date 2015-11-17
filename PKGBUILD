# Maintainer: Raphael Nestler <raphael.nestler@gmail.com>
pkgname=git-dude-git
pkgver=r67.4a38c50
pkgrel=1
pkgdesc="A simple git desktop notifier"
arch=('any')
url="https://github.com/sickill/git-dude"
license=('GPL')
groups=()
depends=('bash')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/sickill/git-dude.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D git-dude "$pkgdir/usr/bin/git-dude"
}

