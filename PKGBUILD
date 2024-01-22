# Maintainer: Arne Jünemann	<das-iro@das-iro.de>

pkgname=linpac-git
pkgver=0.28
pkgrel=1
pkgdesc="Amateur Radio AX.25 chat and PBBS program using Linux's AX.25 stack"
arch=('x86_64')
url="https://sourceforge.net/projects/linpac/"
license=('GPLv2')
depends=('libax25' 'ax25-apps' 'ncurses5-compat-libs' 'perl')
makedepends=('git')
conflicts=()
provides=('linpac')
replaces=('linpac')
source=(git+'https://git.code.sf.net/p/linpac/linpac')
sha256sums=('SKIP')

build() {
	cd ${pkgname%-git}
	autoreconf --install
	./configure
}

package() {
	cd ${pkgname%-git}
	make install DESTDIR=$pkgdir
}
