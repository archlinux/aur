# Maintainer: mcol <mcol at posteo dot net>

pkgname=bkmkfi-git
pkgver=r8.43eb798
pkgrel=1
pkgdesc="rofi-based web-browser independent bookmark manager"
url="https://github.com/m-col/bkmkfi"
arch=('any')
license=('GPL3')
source=("git+$url")
depends=('python3' 'rofi')
makedepends=('git')
optdepends=()

sha256sums=('SKIP')
provides=("bkmkfi")

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
