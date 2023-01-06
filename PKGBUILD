# fases Arch Linux and Debian GNU/Linux packages
# Maintainer: Ferass EL HAFIDI <vitali64pmemail@protonmail.com>
pkgname=fasesbox-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=247.25f1754
pkgrel=1
pkgdesc="Simple utilities for a fully functionnal UNIX-like system."
arch=('any')
url="https://git.vitali64.duckdns.org/utils/fases.git"
license=('GPL3', 'custom:3BSD', 'custom:FreeBSDDocumentationLicense')
groups=()
depends=()
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=("$srcdir/${pkgname%box-git}"::'git+https://git.vitali64.duckdns.org/git/utils/fases.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%box-git}"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%box-git}"
	make prepbox genbox box
}

package() {
	cd "$srcdir/${pkgname%box-git}"
	make DESTDIR="$pkgdir/" install-box
}
