# Maintainer: George Raven <GeorgeRavenCommunity PLUS pythoncdsapi AT pm DOT me>

pkgname=python-cdsapi
_name=${pkgname#python-}
pkgdesc="Copernicus Common Data Store API (was Climate Data Store)"
pkgver=0.7.3 # renovate: datasource=github-tags depName=ecmwf/cdsapi
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://github.com/ecmwf/cdsapi"
license=('apache')
conflicts=()
provides=()
depends=("python-tqdm" "python-requests")
makedepends=('python-setuptools')
source=(
  https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
)
b2sums=('e4dec29df53588bc76518ee096572be812d2385429669cf4634d5e02a25def90f7a709e4d5e4abc23b54377ce0ae4dd9057a2637388c9f05226c2f3cff10357a')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
