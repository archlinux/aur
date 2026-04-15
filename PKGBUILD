# Maintainer: Winícius Cota <winicius.cota@gmail.com>
pkgname=python-datafiles
pkgver=2.5
pkgrel=1
pkgdesc="File-based ORM for dataclasses."
arch=('any')
url="https://github.com/jacebrowning/datafiles"
license=('MIT')
depends=('python'
         'python-cached-property'
         'python-classproperties'
         'python-json-five'
         'python-minilog'
         'python-parse'
         'python-ruamel-yaml'
         'python-tomlkit')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
source=("https://files.pythonhosted.org/packages/61/76/6937ed351391dbfab0ea3bb3e52be8499de033009a2d211fe95f5c2dde77/datafiles-${pkgver}.tar.gz")
sha256sums=('432498336b57aaa9e3427f3c2cf0c558b980a01d825661da9df61076b3b84f8e')

build() {
    cd "datafiles-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "datafiles-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
