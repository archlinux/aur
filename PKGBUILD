# Maintainer: tuximail <admin@tuximail.de>
pkgname=spacemacs-dev
pkgver=0.300.0
pkgrel=2
pkgdesc="A community-driven Emacs distribution - Development version"
arch=('any')
url='https://spacemacs.org'
depends=('emacs')
conflicts=('spacemacs')
makedepends=('git')
md5sums=('SKIP')
license=('GPL3')
source=($pkgname::git+https://github.com/syl20bnr/spacemacs#branch=develop)

pkgver() {
	cd "$pkgname"
	cat CHANGELOG.develop | sed '1,/END_EXAMPLE/d' | sed -n '3p' | cut -d\  -f2
}

package() {
	mkdir -p ~/.emacs.d/
	touch ~/.emacs.d/.lock
	cp -r "$pkgname"/. ~/.emacs.d
	rm -r "$pkgname"
	echo
	echo -e "\033[0;31mAs spacemacs is only a configuration set, you just call emacs to run it\033[0m"
	echo
}
