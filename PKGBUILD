# Maintainer: George Raven <GeorgeRavenCommunity PLUS pythoncdsapi AT pm DOT me>

pkgname=python-cdsapi
_name=${pkgname#python-}
pkgdesc="Copernicus Common Data Store API (was Climate Data Store)"
pkgver=0.7.0 # renovate: datasource=github-tags depName=ecmwf/cdsapi
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
b2sums=('2a954e36114120236185739b66351fc2a4108d34b1dda0d86b4fda0281810ff09fb601221d7d4a5a3cadf1ddb799b51789b8ae1a7fcaeec9e897f831c1106857')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
