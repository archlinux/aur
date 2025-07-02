# Maintainer: insmtr <insmtr@insmtr.cn>

pkgname=python-colcon-cargo
pkgver=dev
pkgrel=1
pkgdesc='An extension for colcon-core to support Rust projects built with Cargo'
arch=('any')
url='https://github.com/colcon/colcon-cargo'
license=('Apache-2.0')
depends=('python' 'python-setuptools')
makedepends=('python-setuptools')

source=("$pkgname::git+https://github.com/colcon/colcon-cargo")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
