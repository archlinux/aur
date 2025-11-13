# Maintainer: Clément Vicart <clem.vicart@gmail.com>

pkgname=zsh-command-not-found-git
pkgver=r7635.dca16e8
pkgrel=1
pkgdesc="ZSH command-not-found plugin"
arch=(any)
url="https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/command-not-found"
install=INSTALL.install
license=('MIT')
depends=('pkgfile')
makedepends=('git')
optdepends=('zsh')
source=("${pkgname}::git+https://github.com/ohmyzsh/ohmyzsh.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -d $pkgdir/usr/share/zsh/plugins/zsh-command-not-found
	install -d $pkgdir/usr/share/licenses/zsh-command-not-found-git

	install -m 644 $pkgname/plugins/command-not-found/command-not-found.plugin.zsh $pkgdir/usr/share/zsh/plugins/zsh-command-not-found/zsh-command-not-found.plugin.zsh
	install -m 644 $pkgname/LICENSE.txt $pkgdir/usr/share/licenses/zsh-command-not-found-git/LICENSE
}
