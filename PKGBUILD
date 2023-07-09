# Maintainer: Eike Baran <eike.baran at uni-oldenburg.de>

pkgname=bsync-git
pkgver=90.d457742
pkgrel=1
pkgdesc="Bidirectional Synchronization using Rsync"
url="https://github.com/dooblem/bsync"
license=('GPL')
depends=('python>=3')
makedepends=('git')
arch=('any')
source=("git+https://github.com/dooblem/bsync")
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

# see also https://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
pkgver() {
	cd "$srcdir/bsync"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
	install -D "$srcdir/bsync/bsync" "$pkgdir/usr/bin/bsync"
}
