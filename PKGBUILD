# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Achilleas Pipinellis <axil@archlinux.gr>

# shellcheck disable=SC2034
_name="progress"
pkgname="python2-${_name}"
_pkgname="${_name}"
pkgver=1.3
pkgrel=2
pkgdesc="Easy to use progress bars"
url="http://github.com/verigak/${_name}/"
arch=('any')
license=('MIT')
depends=('python2')
makedepends=('python2-distribute')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c88d89ee3bd06716a0b8b5504d9c3bcb3c1c0ab98f96dc7f1dc5f56812a4f60a')

# shellcheck disable=SC2154
package() {
  cd "${srcdir}/${_name}-${pkgver}" || exit
  python2 setup.py install --root="${pkgdir}" -O1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
