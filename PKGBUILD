# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>

pkgname=('python-securesystemslib')
pkgver=0.10.10
pkgrel=1
pkgdesc="Cryptographic and general-purpose routines for Secure Systems Lab projects at NYU"
arch=('any')
license=('MIT')
url="https://github.com/secure-systems-lab/securesystemslib"
depends=('python-cryptography' 'python-pynacl' 'python-colorama' 'python-six')
optdepends=()
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/secure-systems-lab/securesystemslib/archive/v${pkgver}.tar.gz"
    "${pkgname}-${pkgver}.tar.gz.asc::https://github.com/secure-systems-lab/securesystemslib/releases/download/v${pkgver}/securesystemslib-${pkgver}.tar.gz.asc")

md5sums=('2b8999ec9b6695a7bee49a72c616eac6'
         'SKIP')
sha256sums=('ea2c4f8353dc33e7e90f15b3ddff27bbc4210c815ef82c7477acba22f40aed09'
            'SKIP')
sha512sums=('d4eb34952d755a4b9b589c71739d11ed98cb395e0a8cea356c8763d7f4017410a2c6092f52f28bc541dd1a984d256e3311b22e6e1dc73a64c2b45663c460b5f8'
            'SKIP')
validpgpkeys=("3E87BB339378BC7B3DD0E5B25DEE9B97B0E2289A")

build() { 
    cd ${srcdir}/securesystemslib-${pkgver}
    python setup.py build
}

package_python-securesystemslib() {
	depends=("python")

    cd securesystemslib-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}
