# Maintainer: Danny Grove <dgrove@hashbang.sh>
pkgname=mtls
pkgver=0.10.4
pkgrel=1
pkgdesc="A short-lived certificate tool based on the Zero Trust network model"
url="https://github.com/drgrove/mtls-cli"
license=("Apache")
arch=("any")
depends=("nss"
         "python-click"
         "python-cryptography"
         "python-gnupg"
         "python-pyopenssl"
         "python-requests"
         "python-urllib3")
makedepends=("python-setuptools")
source=("https://pypi.io/packages/source/m/mtls/${pkgname}-${pkgver}.tar.gz"
		"https://pypi.io/packages/source/m/mtls/${pkgname}-${pkgver}.tar.gz.asc")
# source=("https://github.com/drGrove/mtls-cli/releases/download/v$pkgver/mtls-$pkgver.tar.gz")
sha256sums=('15d89440da35ba7cedaffed4ba6e5a7a1f0eb428ad4c79794433eda6f132f83f'
            'SKIP')
validpgpkeys=('C92FE5A3FBD58DD3EC5AA26BB10116B8193F2DBD')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
