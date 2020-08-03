# Maintainer: mcol <mcol at posteo dot net>

# PKGBUILD @ mcol.xyz/code/css-html-js-minify-git

pkgname=css-html-js-minify-git
pkgver=r339.8f72452
pkgrel=1
pkgdesc="StandAlone Async cross-platform Minifier for the Web."
url="https://github.com/juancarlospaco/css-html-js-minify"
arch=('any')
license=('GPL3')
source=("git+$url")
depends=()
makedepends=('git' 'python-setuptools')
optdepends=()
sha256sums=('SKIP')
provides=("css-html-js-minify")

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
