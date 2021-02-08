# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=python-strictyaml
_pkgname=strictyaml
pkgver=1.3.2
pkgrel=1
pkgdesc='A type-safe YAML parser that parses a restricted subset of the YAML specificaton'
arch=(any)
url="http://hitchdev.com/$_pkgname"
license=('MIT')
depends=('python' 'python-dateutil' 'python-ruamel-yaml')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('637399fd80dccc95f5287b2606b74098b23c08031b7ec33c5afb314ccbf10948')

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
