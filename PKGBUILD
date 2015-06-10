# Maintainer: Axilleas Pipinellis <axilleas@archlinux.info>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>

pkgname=python2-ghp-import
_pkgname=ghp-import
pkgver=0.4.1
pkgrel=1
pkgdesc="Copy your docs directly to the gh-pages branch."
arch=(any)
url="http://github.com/davisp/ghp-import"
license=(custom)
depends=("python2")
replaces=("ghp-import")
conflicts=("ghp-import")
makedepends=("python2-distribute")
source=("http://pypi.python.org/packages/source/g/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644  LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('99e018372990c03ab355aa62c34965c5')
