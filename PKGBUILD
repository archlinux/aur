# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-degiro-connector"
pkgver=2.0.21
pkgrel=2
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
# see https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=python-cleo-git
makedepends=("python-pyproject2setuppy"
             "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Chavithra/degiro-connector/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b481986cd14b8b2ccff2eaeb2f47eb9706fbd76b863f98402afa1a7c26e7de99')

build(){
 cd "degiro-connector-$pkgver"
 python -m pyproject2setuppy build
}

package(){
 cd "degiro-connector-$pkgver"
 python -m pyproject2setuppy install --skip-build --root="$pkgdir" --optimize=1
}
