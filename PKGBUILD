# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-degiro-connector"
pkgver=2.0.23
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
sha256sums=('0b19911cb0899d81c62c61ae72cdfe654b82496c1b7f128b21b7b5ba17d27521')
options=("!strip")

build(){
 cd "degiro-connector-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "degiro-connector-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
