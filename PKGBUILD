# Maintainer: Seppia <seppia@seppio.fish>
pkgname=repofish-git
pkgver=r9.19d76f4
pkgrel=1
pkgdesc="My friends told me to make available this script I wrote to manage my local archlinux repo and AUR packages, so here it is."
arch=('any')
url="https://git.seppia.net/repofish.git"
license=('GPLv3')
groups=()
depends=('curl' 'git' 'jq')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname}","${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('repofish::git+https://git.seppia.net/repofish.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D repo.sh $pkgdir/usr/bin/repofish
}
