# Maintainer: Nicolas Bizzozzéro <nicolas.bizzozzero@protonmail.com>
pkgname="python-cherche"
pkgver=0.0.1
pkgrel=1
pkgdesc="Neural Search for middle sized corpus"
arch=("any")
url="https://raphaelsty.github.io/cherche/"
license=('MIT')
provides=("python-cherche")
conflicts=("python-cherche-git")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/raphaelsty/cherche/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=("SKIP")


build() {
  cd "${srcdir}/cherche-${pkgver}" 
  python setup.py build
}


package() {
  cd "${srcdir}/cherche-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  
  install -m755 -d "${pkgdir}/usr/share/licenses/python-cherche-git"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/python-cherche-git/" 
}

