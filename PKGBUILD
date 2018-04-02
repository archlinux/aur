# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>

pkgname=('python-securesystemslib')
pkgver=0.10.11
pkgrel=1
pkgdesc="Cryptographic and general-purpose routines for Secure Systems Lab projects at NYU"
arch=('any')
license=('MIT')
url="https://github.com/secure-systems-lab/securesystemslib"
depends=('python-cryptography' 'python-pynacl' 'python-colorama' 'python-six')
optdepends=()
makedepends=('python-setuptools')
source=("securesystemslib-${pkgver}.tar.gz::https://github.com/secure-systems-lab/securesystemslib/archive/v${pkgver}.tar.gz"
    "https://github.com/secure-systems-lab/securesystemslib/releases/download/v${pkgver}/securesystemslib-${pkgver}.tar.gz.asc")
md5sums=('c0ac2b61b8bd5682e3e0a67a0af41326'
         'SKIP')
sha256sums=('bf515e819ec5411a23038ee0662150c0dbee87286bb4b0c10632d37f3fc556df'
            'SKIP')
sha512sums=('55a17eed3639934e36864b7b9e29fc4cd204bbd9064a0d6bb667df20eaf4d34ddc8778b9725062c593de193b97989798a161514b156e71bd03cc4fdb964951b3'
            'SKIP')
validpgpkeys=("3E87BB339378BC7B3DD0E5B25DEE9B97B0E2289A"
    # Vladimir Diaz (upstream maintainer)
    )

build() { 
    cd "${srcdir}/securesystemslib-${pkgver}"
    python setup.py build
}

package_python-securesystemslib() {
	depends=("python")

    cd "securesystemslib-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
