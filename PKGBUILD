# Maintainer: George Raven <GeorgeRavenCommunity PLUS pythoncdsapi AT pm DOT me>

pkgname=python-cdsapi
_name=${pkgname#python-}
pkgdesc="Copernicus Common Data Store API (was Climate Data Store)"
pkgver=0.7.5 # renovate: datasource=github-tags depName=ecmwf/cdsapi
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
b2sums=('9293de3c3a058dd2a9594929710638ce0889dfd0db21f57fd0d567b4a7af96315c91acc09db5b8c952a1bb4c0ce17dd8309b7215588fd598c5c18554343e6621')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
