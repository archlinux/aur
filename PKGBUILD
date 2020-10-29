# Maintainer: Danny Grove <dgrove@hashbang.sh>
pkgname=mtls
pkgver=0.14.2
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
makedepends=("python-setuptools" "python-setuptools-scm")
source=("https://pypi.io/packages/source/m/mtls/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('be8e53ff04b1d47e2a28369bee668da6886cceea035e82d1f4cd2fc5e008f20b'
            'SKIP')
validpgpkeys=('C92FE5A3FBD58DD3EC5AA26BB10116B8193F2DBD') # Danny Grove <dgrove@hashbang.sh>

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
