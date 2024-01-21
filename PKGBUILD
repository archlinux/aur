# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="toc"
_pkgname="tableofcontents"
pkgver=2.0.0
pkgrel=1
pkgdesc="Generate a table of contents from the comments of a file"
url="https://github.com/AlphaJack/toc"
license=("GPL3")
arch=("any")
depends=("python")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('81d39213e4544e93b03c0d25058c724a73fcacf6c1a51c9537a5be96ba0e136748c741b78cdb63d0adb86dc142a18efc1998097bf2e8d388d2f334b5147e0da7')

build(){
 cd "$_pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/toc"
}
