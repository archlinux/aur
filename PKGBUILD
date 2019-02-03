#Maintainer: Lothar_m <lothar_m at riseup dot net>

_pkgname=kraken-wsclient
__pkgname=python-$_pkgname
pkgname=$__pkgname-git
pkgver=1
pkgrel=1
pkgdesc="Sample Kraken WebSockets client in Python. This client was created for demonstration purposes only."
arch=("any")
url="https://github.com/krakenfx/kraken-wsclient-py"
license=("MIT")
provides=($__pkgname)
conflicts=($__pkgname)
depends=("python"
         "python-asn1crypto"
		 "python-attrs"
		 "python-autobahn"
		 "python-automat"
		 "python-cffi"
		 "python-constantly"
		 "python-cryptography"
		 "python-hyperlink"
		 "python-idna"
		 "python-incremental"
		 "python-pyasn1"
		 "python-pyasn1-modules"
		 "python-pycparser"
		 "python-pyhamcrest"
		 "python-pyopenssl"
		 "python-service-identity"
		 "python-six"
		 "python-twisted"
		 "python-txaio"
		 "python-zope-schema")
makedepends=("python-setuptools")
source=("https://github.com/krakenfx/kraken-wsclient-py.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py test
}

