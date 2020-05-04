# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=python-sphinx-sitemap
pkgver=2.1.0
pkgrel=1
pkgdesc="Sphinx extension to silently generate a sitemap for HTML builds"
url="https://github.com/jdillard/sphinx-sitemap"
license=('MIT')
arch=('any')
depends=('python-sphinx' 'python-six')
makedepends=('python-setuptools' 'git')
source=("git+${url}#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
  cd "$srcdir/sphinx-sitemap"
  python setup.py build
}

package() {
  cd "$srcdir/sphinx-sitemap"
  python setup.py install --root="$pkgdir/" --optimize=1
  
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sts=2 sw=2 et ft=PKGBUILD
