# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=python-androguard-git
pkgver=3.3.5.r240.g22849b69
pkgrel=2
pkgdesc="Reverse engineering, Malware and goodware analysis of Android applications"
arch=("any")
url='https://github.com/androguard/androguard'
license=("Apache")
depends=("python" "ipython" "python-future" "python-networkx" "python-pygments" "python-lxml" "python-colorama" "python-matplotlib" "python-asn1crypto" "python-click" "python-pydot")
makedepends=("python-setuptools" "git")
options=(!emptydirs)
source=("${pkgname}::git+${url}.git")
sha1sums=("SKIP")

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
