# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-degiro-connector-git"
pkgver=0.0.8.r0.g6957de4
pkgrel=1
pkgdesc="Yet another library to access Degiro's API"
url="https://github.com/Chavithra/degiro-connector"
license=("BSD-3")
arch=("any")
provides=("degiro-connector" "python-degiro-connector")
depends=("python-grpcio" "python-onetimepass" "python-orjson" "python-pandas" "python-protobuf" "python-requests" "python-wrapt")
makedepends=("python-setuptools" "python-wheel")
source=("git+$url")
sha256sums=("SKIP")

pkgver(){
 cd "degiro-connector"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build(){
 cd "degiro-connector"
 python setup.py build
}

package(){
 cd "degiro-connector"
 python setup.py install --root="$pkgdir" --optimize=1
}
