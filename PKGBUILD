# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-degiro-connector"
_name="degiro_connector"
pkgver=3.0.36
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
makedepends=("python-build" "python-installer" "python-wheel" "python-poetry")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('37cb7a45f9c0e9ff5bebc8f61e507533d5baf6044649f0415d5f8c8d8acdd6d72f0935f9a3019d4c6187ebd191b03f354dc022cdd5c2db9ab56bad0e91960bbd')
options=("!strip")

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
