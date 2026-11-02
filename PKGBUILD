# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="toc"
_pkgname="tableofcontents"
pkgver=2.7.4
pkgrel=1
pkgdesc="Generate a table of contents from the comments of a file"
url="https://github.com/AlphaJack/toc"
license=("GPL3")
arch=("any")
depends=("python" "python-importlib-metadata")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('7f888e2cf2145917f5a8c0aa0f20e04ef65c397345bd3fa31dfcd098cefc2df1c077f78ea735530c49c415d418d6a2b3206ef3850408f3be0290196f6ef53634')

build(){
 cd "$_pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/toc"
}
