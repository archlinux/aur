# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

_name=django-taggit
pkgname=python-${_name}
pkgver=4.0.0
pkgrel=1
pkgdesc="Simple tagging application for Django"
arch=('any')
url="https://github.com/jazzband/django-taggit/"
license=('BSD')
depends=(python-django)
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz)
sha256sums=('3fffde3126519d2466642eb86102d2b68414db66280134a563da31d808c456b4')


build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
