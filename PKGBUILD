# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

_name=django-taggit
pkgname=python-${_name}
pkgver=6.1.0
pkgrel=1
pkgdesc="Simple tagging application for Django"
arch=('any')
url="https://github.com/jazzband/django-taggit/"
license=('BSD')
depends=(python-django)
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz)
sha256sums=('249916a4dae3c68c1a49e75e731f78dc213e70b46491a3e080b9cbbe2b88ec64')


build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
