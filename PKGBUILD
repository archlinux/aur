# Maintainer: Phitherek_ <phitherek@gmail.com>
pkgname=smart-playerctl-git
pkgver=0.2.2.r0.f7d601e
pkgrel=2
pkgdesc="A smart wrapper for playerctl"
arch=(x86_64)
url="https://gitlab.com/Phitherek_/smart-playerctl"
license=('MIT')
depends=('playerctl' 'libnotify')
makedepends=('git' 'crystal' 'shards') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=('smart-playerctl-git')
conflicts=('smart-playerctl-git')
source=('git+https://gitlab.com/Phitherek_/smart-playerctl.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/smart-playerctl"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/smart-playerctl"
}

build() {
	cd "$srcdir/smart-playerctl"
	./build.sh
}

package() {
	cd "$srcdir/smart-playerctl"
	PREFIX="$pkgdir/usr" ./install.sh
}
