# Maintainer: thaliarchos <thaliarchos at protonmail dot com>
pkgname=bookmenu-git
pkgver=r90.fa6b93e
pkgrel=1
pkgdesc="Command line interface ebooks browser and downloader for LibGen using the InterPlanetary File System."
arch=('any')
url="https://github.com/kusky3/bookmenu"
license=('GPL')
groups=()
depends=('chafa' 'wget')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=(
	'git+https://github.com/kusky3/bookmenu'
)
noextract=()
md5sums=(
	'SKIP'
)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 "${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
