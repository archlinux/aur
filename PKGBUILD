# Maintainer: Achilleas Pipinellis <axilleas archlinux gr>
# Note: This is a fork fixing numerous bugs. You will not find this version
# in pypi.

pkgname=python2-pypcap
_pkgname=pypcap
pkgver=1.2.3
pkgrel=1
pkgdesc="A simplified object-oriented Python wrapper for libpcap"
arch=(any)
url="https://github.com/pynetwork/pypcap"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=(https://github.com/pynetwork/$_pkgname/archive/v${pkgver}.zip)

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
sha512sums=('ce051d4864697b506e28faa5bc4ae1a58d9730d5a29cd514d6de1d3e0a2fe74a9c130fa242657745ad5d97059e3843bee90bf1aa079df92a668134ad6867a9d9')
