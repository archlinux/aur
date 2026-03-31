# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# Contributor: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=python-spdx-tools
_name=tools-python
pkgver=0.8.3
pkgrel=1
pkgdesc='A Python library to parse, validate and create SPDX documents.'
url='https://github.com/spdx/tools-python'
makedepends=(git python-build python-installer python-setuptools-scm)
depends=(python python-click python-yaml python-xmltodict python-rdflib python-beartype python-uritools python-license-expression python-ply python-semantic-version)
checkdepends=(python-pytest python-pyshacl python-tzdata)
license=('Apache-2.0')
arch=('any')
source=("git+https://github.com/spdx/tools-python.git#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
    cd "$srcdir/$_name"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
