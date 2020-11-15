# Maintainer: GI Jack <gi_jack@hackermail.com>

pkgname=python-blue-loader
pkgver=0.1.34
pkgrel=1
pkgdesc="Python tools to communicate with Ledger Blue, Nano S and Nano X"
arch=('any')
url="https://github.com/LedgerHQ/blue-loader-python"
license=('Apache')
# missing: python-u2flib-host
depends=('python' 'python-hidapi' 'python-protobuf' 'python-pycryptodomex'
         'python-future' 'python-pillow' 'python-websocket-client' 'python-u2flib-host')
makedepends=('python-setuptools' 'python-ecpy')
checkdepends=()
optdepends=('python-pyscard: smartcard')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LedgerHQ/blue-loader-python/archive/${pkgver}.tar.gz")
sha256sums=('46c22c8ca4961f5a471bb8eae9d4a681737aa345e8f8760e3a00bae66f4a733e')

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

#build() {
#	cd "$pkgname-$pkgver"
#	./configure --prefix=/usr
#	make
#}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}


package() {
  cd blue-loader-python-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
