# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-degiro-connector"
pkgver=2.0.22
pkgrel=1
pkgdesc="Yet another library to access Degiro's API"
url="https://github.com/Chavithra/degiro-connector"
license=("BSD-3")
arch=("any")
provides=("degiro-connector")
depends=("python"
         "python-grpcio"
         "python-onetimepass"
         "python-pandas"
         "python-protobuf"
         "python-requests"
         "python-wrapt")
makedepends=("python-build" "python-installer" "python-wheel")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Chavithra/degiro-connector/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('04015ecb3ddb1b23573abe02cbee2dc9fc42df58d65d3168fad436a7f82d795e')
options=("!strip")

build(){
 cd "degiro-connector-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "degiro-connector-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
