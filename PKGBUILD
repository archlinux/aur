# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=python-strictyaml
_pkgname=strictyaml
pkgver=1.6.2
pkgrel=1
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
sha256sums=('70cd55980fe2929dc038924ca08f68f96148223a8777810fa616e3478ebe71ca')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
