# Maintainer: Mark Kostovetskyy <mark@sgtxd.de>
pkgname='ani-cli-git'
_pkgname='ani-cli'
pkgver='r23.986d561'
pkgrel=1
pkgdesc="A cli to browse and watch anime."
arch=('x86_64')
url="https://github.com/pystardust/ani-cli"
license=('GPL')
depends=('grep' 'curl' 'sed' 'mpv')
makedepends=('git')
source=('ani-cli::git://github.com/pystardust/ani-cli.git')
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_pkgname%-VCS}"
	install -Dm755 ./ani-cli "$pkgdir/usr/bin/ani-cli"
}
