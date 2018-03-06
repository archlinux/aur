# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>

pkgname=('in-toto')
pkgver=0.2.1
pkgrel=1
pkgdesc="A framework to secure your software supply chain"
arch=('any')
license=('MIT')
url="https://in-toto.io"
depends=('python-cryptography'
    'python-securesystemslib>=0.10.9'
    'python-iso8601'
    'python-attrs'
    'python-dateutil'
    'python-six')
optdepends=("gnupg: pgp signing/verification")
makedepends=('python' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/in-toto/in-toto/archive/${pkgver}.tar.gz"
    "${pkgname}-${pkgver}.tar.gz.asc::https://github.com/in-toto/in-toto/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
md5sums=('2e50e54f57bd39fee116db79c595c4e1'
         'SKIP')
sha256sums=('f9c43c93c3c0ba1395d52b5aaf89625598454ef73f5b8558b1062753d8c015c1'
            'SKIP')
sha512sums=('0d3fa8ba219b448b4e8978eb4c842c01cf039cabb7f1779e8e805c81d5ef5ad92c01ec55efe235ba92f253d502e6518d8e6da6c63cc41ea40445d218c78a7369'
            'SKIP')

validpgpkeys=("8BA69B87D43BE294F23E812089A2AD3C07D962E8")

build() {
    cd "$srcdir/$pkgname-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
