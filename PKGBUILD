# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="toc"
_pkgname="tableofcontents"
pkgver=2.1.0
pkgrel=1
pkgdesc="Generate a table of contents from the comments of a file"
url="https://github.com/AlphaJack/toc"
license=("GPL3")
arch=("any")
depends=("python")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('e0c5a56332bd976c2bdd4c4be0ab9abb9b992f37b711b24de8336c23e6c78bb50b8c76b884969c33fe63f67edb507fbe5a80c73d508a933c3af99bf09b190e45')

build(){
 cd "$_pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/toc"
}
