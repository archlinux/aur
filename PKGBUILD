# Contributor:  <clu>
# Maintainer:  Achilleas Pipinellis <axilleas archlinux info>

pkgname=python2-smartypants
_pkgname=smartypants
pkgver=1.8.6
pkgrel=1
pkgdesc="A smart-quotes plugin"
url="http://web.chad.org/projects/smartypants.py/"
arch=('any')
license=('BSD')
depends=(python2)
source=(http://pypi.python.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)

package()
{
  cd "${srcdir}/${_pkgname}-$pkgver"

  mkdir -p "${pkgdir}"/usr/share/licenses/$_pkgname
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/$_pkgname/LICENSE"

  # python2 fix
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' setup.py
  sed -i 's|#!/usr/bin/python|#!/usr/bin/env python2|' smartypants{.py,}
  python2 setup.py install --root="${pkgdir}" -O1
}
md5sums=('97484a618fc35508ca2961445f4aa597')
