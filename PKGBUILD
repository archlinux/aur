# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=pass-git-helper
pkgver=2.0.0
pkgrel=1
pkgdesc="A git credential helper interfacing with pass, the standard unix password manager"
arch=(any)
url="https://github.com/languitar/pass-git-helper"
license=('LGPL3')
depends=('python3' 'pass' 'python-xdg')
makedepends=(git python-setuptools python-build python-installer python-wheel)
source=("https://github.com/languitar/pass-git-helper/archive/v${pkgver}.tar.gz")
sha256sums=('04a48285af405e1358139bb83193484b198e7b19f782f1b97165b62d2c964bfd')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
