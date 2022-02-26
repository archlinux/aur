# Maintainer: Patrick Guenther <info at paddybu dot de>
# PKGBUILD copied from xontrib-prompt-vi-mode-git

pkgname=xontrib-fzf-widgets
pkgver=r43.8af47d1
pkgrel=1
pkgdesc="Set of fzf widgets for xonsh"
url="https://github.com/laloch/xontrib-fzf-widgets"
arch=('any')
license=('GPL3')
source=("git+$url")
depends=('python3' 'xonsh' 'fzf')
makedepends=('git' 'python-setuptools')
optdepends=()

sha256sums=('SKIP')
provides=()

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

