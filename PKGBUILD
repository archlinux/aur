# Maintainer: mcol <mcol at posteo dot net>

pkgname=xontrib-z-git
pkgver=r35.ef05c35
pkgrel=1
pkgdesc="Port of z to xonsh. Tracks your most used directories, based on 'frecency'."
url="https://github.com/astronouth7303/xontrib-z"
arch=('any')
license=('GPL3')
source=("git+$url")
depends=('python3')
makedepends=('git' 'python-setuptools')
optdepends=()

sha256sums=('SKIP')
provides=("xontrib-z")

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
