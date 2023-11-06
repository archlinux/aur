# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

_name=django-taggit
pkgname=python-${_name}
pkgver=5.0.1
pkgrel=1
pkgdesc="Simple tagging application for Django"
arch=('any')
url="https://github.com/jazzband/django-taggit/"
license=('BSD')
depends=(python-django)
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz)
sha256sums=('31c904449a9873ebd9b476e353af944f012ef34331a013caec884add50895d39')


build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
