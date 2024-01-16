# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-charts-plugin"
_pkgname="${pkgname}"
pkgver=0.0.10
pkgrel=1
pkgdesc="Mkdocs plugin to add vegalite charts to your pages"
url="https://github.com/timvink/mkdocs-charts-plugin"
license=("MIT")
arch=("any")
depends=("mkdocs" "pymdown-extensions")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('7e3da74645c7ecf4b4a7d4a848622bbeaa672bf2174c18a3e46273d3d02f2ec43a59ca959050790bed16e3ddea29412145d5c54577c205291cad26877d811061')

build(){
 cd "$_pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 664 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
