# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-degiro-connector"
_name="degiro_connector"
pkgver=3.0.11
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
makedepends=("python-build" "python-installer" "python-wheel" "python-poetry")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('ab7d3a6f77d0d0e3f224d47c9c2ac3864b910792a7b21cb72b00f19fbf13a454e13f2a8bb51bb5c189985fb3e8d800a46a9c46cee3cf5d7dbbc05dea5689b4a3')
options=("!strip")

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
