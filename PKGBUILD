# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-polyline"
_name="${pkgname#python-}"
pkgver=2.0.5
pkgrel=1
pkgdesc="A Python implementation of Google's Encoded Polyline Algorithm Format"
arch=(any)
url="https://github.com/frederickjansen/polyline"
license=('MIT')
depends=("python")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('207bb98250101b65afe171cdcf048822486e9ebcd8a7b69f54dcda86ecc8cfff9aeb1a6f1ee470fca8d04fd34f2dcfd7be213c8123030b7274d6c5726589b2ff')
options=("!strip")

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
