# Maintainer: LiveEmily <emily@liveemily.com>
pkgname=nextpad-git
pkgver=r17.ece42fe
pkgrel=1
pkgdesc="Not so powerful text editor I'm working on, inspired by vim and nano."
arch=(x86_64)
url="https://github.com/LiveEmily/nextpad.git"
license=('GPL')
depends=(glibc)
makedepends=(git)
provides=(nextpad)
conflicts=(nextpad)
source=("git+$url")
md5sums=('SKIP')


pkgver() {
	cd nextpad
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd nextpad
	make
}

package() {
	cd nextpad/
	install -Dm 0755 -t "${pkgdir}"/usr/bin/ nextpad
}
