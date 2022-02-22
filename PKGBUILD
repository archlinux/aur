# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=python-pypacker
pkgver=5.1
pkgrel=1
pkgdesc="The fastest and simplest packet manipulation lib for Python"
arch=('x86_64')
url="https://gitlab.com/mike01/pypacker"
license=('GPL')
depends=('python' 'python-netifaces')
makedepends=('python-setuptools')
source=("https://gitlab.com/mike01/pypacker/-/archive/v$pkgver/pypacker-v$pkgver.tar.gz")
sha256sums=('4d282e2533952e3d4f8aad66898e1db4d23c7cd23692415d70a5237db641e312')

build() {
    cd "$srcdir/pypacker-v$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/pypacker-v$pkgver"
    python setup.py install \
        --prefix=/usr \
        --root="$pkgdir" \
        --optimize=1 \
        --skip-build
}

# vim: set ts=4 sw=4 et :
