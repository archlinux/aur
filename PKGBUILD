pkgname=lxc-ps-git
pkgver=r2.dd941f0
pkgrel=1
pkgdesc="Implementation of lxc-ps for LXC 1.x and 2.x"
arch=(any)
url="https://github.com/2ion/lxc-ps"
license=('GPL')
depends=(lxc python-psutil)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('lxc-ps-git::git+https://github.com/2ion/lxc-ps.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-VCS}"
	install -Dm755 lxc-ps "$pkgdir"/usr/bin/lxc-ps
}
