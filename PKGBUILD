# Maintainer: Franco Masotti <franco dot masotti at live dot com>
# Contributor: Franco Masotti <franco dot masotti at live dot com>
pkgname=python-fpyutils
pkgver=2.0.0
pkgrel=1
pkgdesc="A collection of useful non-standard Python functions which aim to be simple to use"
arch=('any')
url="https://blog.franco.net.eu.org/software/#fpyutils"
license=('GPL3')
depends=('python' 'python-atomicwrites=1.4.0' 'python-yaml=5.4.1.1' 'python-requests=2.25.1')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://blog.franco.net.eu.org/software/fpyutils-${pkgver}.tar.gz.sig" "https://blog.franco.net.eu.org/software/fpyutils-${pkgver}.tar.gz")
sha512sums=('SKIP' '7e56dd953a151369a44b2f7b89c2e28963c744038f54ec24179c7035d272f06787b8ed37eb3ecd794a924f3dd94c845232d225e154e175219aac408415918c5a')

check() {
  cd "${srcdir}"/fpyutils-"${pkgver}"
  python -m unittest discover --failfast --locals --verbose
}

package() {
  cd "${srcdir}"/fpyutils-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
