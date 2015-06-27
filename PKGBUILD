# Maintainer: Sam Stuewe <halosghost at archlinux dot info>

pkgname=ptpst-git
pkgver=0.r67.ef065a9
pkgrel=1

pkgdesc='A small tool to interact with pb instances'
url='https://github.com/HalosGhost/ptpst'
arch=('i686' 'x86_64')
license=('GPL2')

depends=('curl')
makedepends=('git' 'tup' 'clang')

source=('git+https://github.com/HalosGhost/ptpst.git')
sha256sums=('SKIP')

pkgver () {
	cd ptpst
	printf '0.r%s.%s' "$(git rev-list --count HEAD)" "$(git log -1 --pretty=format:%h)"
}

build () {
	cd ptpst
	tup upd
}

package () {
	cd ptpst
	install -Dm755 src/ptpst "$pkgdir"/usr/bin/ptpst
}
