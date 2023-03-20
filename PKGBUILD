# Maintainer: George Raven <GeorgeRavenCommunity PLUS pythoncdsapi AT pm DOT me>

pkgname=python-cdsapi
_name=${pkgname#python-}
pkgdesc="Climate Data Store API"
pkgver=0.6.1
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
b2sums=('f1a06c822bde79d77c74e7e337e49f071e7a9561cf722b97f31fe5bc4dd860404552e1c4b3e2fefe9fd994a4a4a9211e37a4a01444fedaed46b53bf73e126a67')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
