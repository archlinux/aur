# Maintainer: Michael Riegert <michael at eowyn net>
# Contributor: Daniel Moch <daniel AT danielmoch DOT com>
# Contributor: Nathan Owens <ndowens @ artixlinux.org>

pkgname=python-sphinx-sitemap
pkgver=2.4.0
pkgrel=2
pkgdesc="Sphinx extension to silently generate a sitemap for HTML builds"
url="https://github.com/jdillard/sphinx-sitemap"
license=('MIT')
arch=('any')
depends=('python-sphinx' 'python-six')
makedepends=('python-setuptools' 'git')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('220a528de097d4d850de2f57eeb1566b0ad96a08cbdaa0b6e082eb6d55d7c019347ecc1a595c8bf0cec765a045534e6d7e064ce4a66958be1fa72191fcc32e62')

build() {
    cd "$srcdir/sphinx-sitemap-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/sphinx-sitemap-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
