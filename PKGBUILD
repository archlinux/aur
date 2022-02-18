# Maintainer: Molten <craxell.tv@gmail.com>

pkgname=pyfetch-git
pkgver=r158.3e97153
pkgrel=1
pkgdesc="Stylish and simple fetch for your terminal."
arch=('x86_64')
url="https://git.kreatea.space/kreato/pyfetch"
license=('GPL')
depends=('python-distro' 'python-psutil' 'python-colorama' 'otf-font-awesome' 'wmctrl')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://git.kreatea.space/kreato/pyfetch.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX="$pkgdir/usr" install
}

