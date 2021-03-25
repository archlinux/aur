# Maintainer: theguy147 <yakamoz147 (at) protonmail (dot) com>

pkgname=ignorant-git
pkgver=r3.60ea009
pkgrel=1
pkgdesc="ignorant checks if a phone number is used on a list of platforms. (git version)"
url="https://github.com/megadose/ignorant"
depends=('python')
makedepends=('python-setuptools')
license=('GPL3')
conflicts=('ignorant')
arch=('any')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    python setup.py build
}

package() {
    cd "${pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
