# Maintainer: Nicolas Bizzozzéro <nicolas.bizzozzero@protonmail.com>
pkgname="python-river"
pkgver=0.9.0
pkgrel=2
pkgdesc="Online machine learning in Python"
arch=("x86_64")
url="https://riverml.xyz"
license=('custom:BSD 3-clause')
provides=("python-river")
conflicts=("python-river")
depends=("python" "python-numpy" "python-scipy" "python-pandas")
makedepends=("python-setuptools" "cython")
source=("https://github.com/online-ml/river/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=("SKIP")


build() {
  cd "${srcdir}/river-${pkgver}" 
  python setup.py build
}


package() {
  cd "${srcdir}/river-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  
  install -m755 -d "${pkgdir}/usr/share/licenses/python-river-git"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/python-river-git/" 
}

