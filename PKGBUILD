# Maintainer: Márton Szabó <notramo@vipmail.hu>

pkgname="arch-anywhere-lang-tool-git"
pkgver="0.1"
pkgrel=2
pkgdesc="A simple tool for maintain Arch Linux Anywhere translation files."
arch=('i686' 'x86_64')
url="git+https://github.com/notramo/arch-anywhere-lang-tool"
license=('WTFPL')
depends=('gcc-libs')
makedepends=('git' 'gcc')
provides=('arch-anywhere-lang-tool')
conflicts=('arch-anywhere-lang-tool')
source=("$url.git")
md5sums=('SKIP')

build() {
	cd $srcdir/arch-anywhere-lang-tool
	make
}

package() {
	cd "arch-anywhere-lang-tool"
	make DESTDIR=$pkgdir install
	install -D COPYING $pkgdir/usr/share/licenses/arch-anywhere-lang-tool/LICENSE
}
