# Maintainer: George Raven <GeorgeRavenCommunity PLUS pythoncdsapi AT pm DOT me>

pkgname=python-cdsapi
_name=${pkgname#python-}
pkgdesc="Copernicus Common Data Store API (was Climate Data Store)"
pkgver=0.7.4 # renovate: datasource=github-tags depName=ecmwf/cdsapi
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
b2sums=('182ffc6e20f2f40db807d3d708d2e07ed476676ed8a29e00863ff58be419546aaf766b56690d9bb999fe277b3b0a4baa2437e889100fcd2afc506f17c39e1407')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
