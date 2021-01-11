# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=python-strictyaml
_pkgname=strictyaml
pkgver=1.3.0
pkgrel=1
pkgdesc='A type-safe YAML parser that parses a restricted subset of the YAML specificaton'
arch=(any)
url="http://hitchdev.com/$_pkgname"
license=('MIT')
depends=('python' 'python-dateutil' 'python-ruamel-yaml')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('f640ae4e6fe761c3ae7138092c3dcb9b5050ec56e9cbac45d8a6b549d7ec973c')

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
