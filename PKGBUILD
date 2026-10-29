# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-charts-plugin"
_name=${pkgname#python-}
pkgver=0.0.13
pkgrel=3
pkgdesc="Mkdocs plugin to add vegalite charts to your pages"
url="https://github.com/timvink/mkdocs-charts-plugin"
license=("MIT")
arch=("any")
depends=("python" "mkdocs" "pymdown-extensions")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
b2sums=('3237b645b3bb82fbaa36452b2b80c86935408e70f2646cad82f44612325bca33815ff1c41e2cbbbd3a8b79c473e5aead04f1d452a7d00a33fffbbfd64313471e')

build(){
 cd "${_name//-/_}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_name//-/_}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 664 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
