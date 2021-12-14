# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=python-strictyaml
_pkgname=strictyaml
pkgver=1.4.4
pkgrel=2
pkgdesc='A type-safe YAML parser that parses a restricted subset of the YAML specificaton'
arch=(any)
url="http://hitchdev.com/$_pkgname"
license=(MIT)
depends=(python
         python-dateutil
         python-ruamel-yaml)
makedepends=(python-setuptools)
_archive="$_pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_archive.tar.gz")
sha256sums=('044ae3bec56f31e18dff8cfa62a2c9c028f4c7fe4c0f761e50761184d3b68eef')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
