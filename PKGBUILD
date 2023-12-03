# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Kevin Morris <kevr@0cost.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-paginate
pkgver=0.5.6
pkgrel=2
pkgdesc='A simple Python pagination module'
arch=('any')
url="https://github.com/Pylons/paginate"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/Pylons/paginate/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6e86c6ae9933711e7fd3ffb009f51df45353beb356c4e610f5cbb83ebf5dbb5f')

build() {
    cd "$srcdir"/paginate-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/paginate-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
