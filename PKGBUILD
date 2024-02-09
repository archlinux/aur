# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-polyline"
_name="${pkgname#python-}"
pkgver=2.0.1
pkgrel=1
pkgdesc="A Python implementation of Google's Encoded Polyline Algorithm Format"
arch=(any)
url="https://github.com/frederickjansen/polyline"
license=('MIT')
depends=()
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('b83167496a23fce2a8c3318ecec3d7a319e136c14e70d63761fabc88927b7825bda80210b16f0555e726a2541a21235a638cb91670dc68201a2f2e682ad7023b')
options=("!strip")

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
