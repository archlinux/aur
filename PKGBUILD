# Maintainer: a821

pkgname=txt2tags-git
pkgver=3.8.r0.gf570b43
pkgrel=1
pkgdesc="A text formatting and conversion tool"
arch=('any')
url="https://txt2tags.org/"
license=('GPL2')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=('python')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/txt2tags/txt2tags.git#branch=v3")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --tags --long | sed 's/-/.r/;s/-/./g'
}

build() {
    cd "${pkgname%-git}"
    python setup.py build
}

package() {
    cd "${pkgname%-git}"
    python setup.py install --root="$pkgdir"
}

# vim: set ts=4 sw=4 et:
