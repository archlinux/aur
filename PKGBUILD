# Maintainer: Charlie Wolf <charlie@wolf.is>
# Contributor: Charlie Wolf <charlie@wolf.is>

pkgname=python-gpgauth
pkgver=0.1
pkgrel=1
pkgdesc="This module allows easy access to gpgauth's key management, encryption and signature functionality from Python programs." 
url="https://github.com/charliewolf/python-gpgauth"
license=("Tequilaware")
arch=("any")
depends=('python' 'python-gnupg')
makedepends=('python-setuptools')
source=("https://github.com/charliewolf/python-gpgauth/archive/${pkgver}.tar.gz")
sha256sums=('966fd9ddce241288877028a51b8de14cb202585f16e86a0807036e89ac162c84')

build() {
  cd $srcdir/${pkgname}-${pkgver}/
  python setup.py build
}

package() {
  cd $srcdir/${pkgname}-${pkgver}/
  python setup.py install --root=${pkgdir}/ --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

