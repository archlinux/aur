pkgname=neovim-remote-git
pkgver=1.5.2.r0.g9dd9c32
pkgrel=1
pkgdesc="Support --remote and friends for Neovim"
arch=(any)
url="https://github.com/mhinz/neovim-remote"
license=('GPL')
depends=('python-neovim')
makedepends=('python-setuptools')
source=("git+https://github.com/mhinz/neovim-remote.git")
sha1sums=('SKIP')
conflicts=('neovim-remote')
provides=('neovim-remote')

pkgver() {
	cd "$srcdir/${pkgname%%-git}"
	git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/${pkgname%%-git}"
	python setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
