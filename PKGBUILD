# Maintainer: tuximail <admin@tuximail.de>
pkgname=spacemacs
pkgver=0.200.13
pkgrel=3
pkgdesc="A community-driven Emacs distribution - The best editor is neither Emacs nor Vim, it's Emacs *and* Vim!"
arch=('any')
url='https://spacemacs.org'
depends=('emacs')
conflicts=('spacemacs-dev')
makedepends=('git')
md5sums=('SKIP')
license=('GPL3')
source=($pkgname::git+https://github.com/syl20bnr/spacemacs)

pkgver() {
	cd "$pkgname"
	cat CHANGELOG.org | sed -n '2p' | cut -d\  -f2
}

package() {
	mkdir -p ~/.emacs.d
	cp -r "$pkgname"/. ~/.emacs.d
	rm -r "$pkgname"
	echo
	echo -e "\033[0;31mAs spacemacs is only a configuration set, you just call emacs to run it\033[0m"
	echo
}
