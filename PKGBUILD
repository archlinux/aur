# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-wtforms-json"
_name="WTForms-JSON"
pkgver=0.3.5
pkgrel=1
pkgdesc="Adds smart json support for WTForms. Useful for when using WTForms with RESTful APIs"
arch=(any)
url="https://github.com/kvesteri/wtforms-json"
license=('custom')
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('816fc6928045c8d8c4b59cee4e667f7fca0834804fc03b8f1c40af5dcfff6897d31aaeb6d878bcef5032172b8905b5affafccc0d4a0d3a9bc255270ca374ef8e')
options=("!strip")

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
