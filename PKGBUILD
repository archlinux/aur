# Maintainer: Márton Szabó <notramo@vipmail.hu>

pkgname="arch-anywhere-lang-tool-git"
pkgver=r8.6eec9af
pkgrel=1
pkgdesc="A simple tool for maintain Arch Linux Anywhere translation files."
arch=('any')
url="git+https://github.com/notramo/arch-anywhere-lang-tool"
license=('custom:WTFPL')
depends=('perl')
makedepends=('git')
provides=('arch-anywhere-lang-tool')
conflicts=('arch-anywhere-lang-tool')
source=("$url.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/arch-anywhere-lang-tool"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/arch-anywhere-lang-tool"
	install -D arch-anywhere-lang-tool $pkgdir/usr/bin/arch-anywhere-lang-tool
	install -D COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
