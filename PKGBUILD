# Maintainer: Exorcism
# Contributor: Angel Velasquez <angvp@archlinux.org> 
# Contributor: Sergej Pupykin <sergej@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=python-m2crypto
pkgver=0.45.1
pkgrel=1
pkgdesc="A crypto and SSL toolkit for Python"
arch=('x86_64')
url="https://pypi.python.org/pypi/M2Crypto"
license=('BSD')
depends=('python' 'openssl')
makedepends=('python-setuptools' 'swig')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/m2crypto/m2crypto/-/archive/${pkgver}/${pkgname#python-}-${pkgver}.tar.gz"
        "LICENSE")
sha256sums=('0a066b85c0d92c63e8a19066881934b5eadb04aac4f2a440acddf9851b5b2de2'
            '4eca478396f4b2b020729a111fce3f096456d74500bfd8f2b0388c3c69f997c0')

build(){
  cd "m2crypto-$pkgver"
  python setup.py build

}

package() {
  cd "m2crypto-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -D -m644 "$srcdir"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
