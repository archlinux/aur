# Maintainer: Olivier Mehani <shtrom-arch@ssji.net>

pkgname=m17n-im-shortname-unicode-emoji-git
pkgver=r13.eb20fdc
pkgrel=1
pkgdesc="Input method for Unicode Emoji using shortnames "
arch=('i686' 'x86_64')
url="https://github.com/EmptyStackExn/m17n-im-shortname-unicode-emoji"
license=()
depends=('ibus-m17n' 'ttf-symbola')
makedepends=('git' 'make' ) # 'bzr', 'git', 'mercurial' or 'subversion'
optdepends=('ibus-m17n-git: (from AUR) to allow non-US layouts when typing')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
'm17n-im-shortname-unicode-emoji::git+https://github.com/EmptyStackExn/m17n-im-shortname-unicode-emoji'
)

# Please refer to the 'USING git SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	make DESTDIR="${pkgdir}/" install
}

md5sums=('SKIP')
