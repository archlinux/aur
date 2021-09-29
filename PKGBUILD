# Maintainer: Evgeniy Alekseev

pkgname=python-pydeps
_pkgname=pydeps
pkgver=1.10.2
pkgrel=1
pkgdesc="python module dependency visualization tool"
arch=('any')
url="https://github.com/thebjorn/pydeps"
license=('BSD2')
depends=('python-pyaml' 'python-stdlib-list')
makedepends=('python-setuptools')
source=("https://github.com/thebjorn/pydeps/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('5e1367dc22d7fae1794d16be02971d996510eded88afa2114ab99f3e400ff2b08925795b8609f48cb730b7b93cc33fff195a9aad949e43649492a2e9f736a051')
