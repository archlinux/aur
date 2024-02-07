# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="toc"
_pkgname="tableofcontents"
pkgver=2.4.0
pkgrel=1
pkgdesc="Generate a table of contents from the comments of a file"
url="https://github.com/AlphaJack/toc"
license=("GPL3")
arch=("any")
depends=("python")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('1a5758493df397c70566a8499698e20a9caddb98f0b97d31b6a8e121519ccfe8336d72d72ad0b367ce278f7b0603f7da80dbad6b053e23814ec974ba2bc54a2a')

build(){
 cd "$_pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/toc"
}
