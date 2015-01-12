# Maintainer: oi_wtf <brainpower at gulli dot com> 
_name=frosted
pkgname=python-${_name}
pkgver=1.4.1
pkgrel=1
pkgdesc="A simple program which checks Python source files for errors."
arch=('any')
url="https://github.com/timothycrosley/frosted"
license=('MIT')
depends=('python' 'python-pies')
makedepends=('python-setuptools')
source=("${_name}-${pkgver}.tar.gz::https://github.com/timothycrosley/frosted/archive/${pkgver}.tar.gz")
sha256sums=('987ab6f8db3123664f65328f112b3ea26c22963cb8b1264a83e9a2437a58a952')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
