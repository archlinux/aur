# Maintainer: Michael Riegert <michael at eowyn net>
# Contributor: Daniel Moch <daniel AT danielmoch DOT com>
# Contributor: Nathan Owens <ndowens @ artixlinux.org>

pkgname=python-sphinx-sitemap
pkgver=2.2.0
pkgrel=2
pkgdesc="Sphinx extension to silently generate a sitemap for HTML builds"
url="https://github.com/jdillard/sphinx-sitemap"
license=('MIT')
arch=('any')
depends=('python-sphinx' 'python-six')
makedepends=('python-setuptools' 'git')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('fe4a7c2c3c654b3caa5b64c7268cc664b3741d001bf3f78640f523b0b9cf1f117ee58360632114d74cbc7022cc864ad6d4e9a257076ca1e83ecab5545e7492b2')

build() {
    cd "$srcdir/sphinx-sitemap-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/sphinx-sitemap-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
