# Maintainer: Nicolas Bizzozzéro <nicolas.bizzozzero@protonmail.com>
pkgname="python-river-git"
pkgver=0.9.0
pkgrel=3
pkgdesc="Online machine learning in Python"
arch=("x86_64")
url="https://riverml.xyz"
license=('custom:BSD 3-clause')
provides=("python-river")
conflicts=("python-river")
depends=("python-numpy" "python-scipy" "python-pandas")
makedepends=("git" "cython")
source=("git://github.com/online-ml/river.git")
sha512sums=("SKIP")

pkgver() {
  cd "${srcdir}/river"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/river"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  
  install -m755 -d "${pkgdir}/usr/share/licenses/python-river-git"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/python-river-git/" 
}

