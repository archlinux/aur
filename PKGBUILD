# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Kevin Morris <kevr@0cost.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-paginate
pkgver=0.5.7
pkgrel=1
pkgdesc='A simple Python pagination module'
arch=('any')
url="https://github.com/Pylons/paginate"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/Pylons/paginate/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('88eaa65ea111e533542cdd4c8e9f90e5beefaabcf3d62021fb4d1113351bc9c6')

build() {
    cd "$srcdir"/paginate-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/paginate-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
