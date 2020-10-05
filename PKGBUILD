# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=python-thefuck
_pkgname=${pkgname#*-}
pkgver=3.30
pkgrel=1
pkgdesc='Magnificent app which corrects your previous console command.'
arch=('any')
url='https://github.com/nvbn/thefuck'
license=('MIT')
depends=('python' 'python-pyte')
makedepends=('python-setuptools')
#checkdepends=('python-pytest' 'python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nvbn/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('dd2e7bc94e9453beabbafc10c4d62c67601ea705250103a67ababcdad2991dd3')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

#check() {
#    cd "$srcdir/$_pkgname-$pkgver"
#    python setup.py pytest
#}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --optimize=1 --prefix=/usr --root="$pkgdir" --skip-build
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

