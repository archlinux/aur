# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname="python-monerowallet"
_fullpkgname="pymonerowallet"
pkgver=0.1
pkgrel=1
pkgdesc='Python library for the Monero Wallet'
license=('GPL')
arch=('any')
url='https://github.com/chaica/pymonerowallet'
makedepends=('python' 'python-distribute')
depends=('python' 'python-requests>=2.11.1')
source=("https://github.com/chaica/${_fullpkgname}/archive/${pkgver}.tar.gz")
md5sums=('2e774b79e46b8007173117ae1ec73cff')

build() {
  cd "${srcdir}/${_fullpkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_fullpkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
