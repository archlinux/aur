# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="toc"
_pkgname="tableofcontents"
pkgver=2.6.0
pkgrel=1
pkgdesc="Generate a table of contents from the comments of a file"
url="https://github.com/AlphaJack/toc"
license=("GPL3")
arch=("any")
depends=("python" "python-importlib-metadata")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('fbb5a6d1d98f18974d216d7293ce0e65f15cf26b28bae85e41714ff4af81e5f596d57aa2dd1171ec010886ad27f8620446444e9d0ad79164d6512d110d076a49')

build(){
 cd "$_pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/toc"
}
