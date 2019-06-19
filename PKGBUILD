# Maintainer: mcol <mcol at posteo dot net>

pkgname=xontrib-prompt-vi-mode-git
pkgver=r5.ed31f52
pkgrel=1
pkgdesc="vi-mode status formatter for xonsh prompt"
url="https://github.com/t184256/xontrib-prompt-vi-mode"
arch=('any')
license=('GPL3')
source=("git+$url")
depends=('python3')
makedepends=('git' 'python-setuptools')
optdepends=()

sha256sums=('SKIP')
provides=("xontrib-prompt-vi-mode")

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
