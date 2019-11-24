## UPSTREAM:
# Author: Guillaume Chazarain <guichaz<at>gmail<dot>com>
# Maintainer: Enre Hasegeli <emre<at>hasegeli<dot>com>
# Maintainer: Patrick Meyer <git<at>the-space<dot>agency>

## PACKAGE:
# Maintainer: Mike Sampson <mike at sambodata dot com>
# Maintainer: Mikhail f. Shiryaev <mr<dot>felixoid<at>gmail<dot>com>

pkgname=polysh
pkgver=0.9
pkgrel=5
pkgdesc="a tool to aggregate several remote shells into one."
arch=("any")
url="https://pypi.org/project/${pkgname}/"
license=("GPL2")
depends=("python" "openssh")
makedepends=("python-setuptools" "python-docutils")
options=(!emptydirs)
source=("https://github.com/innogames/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=("3f45061ad42fd9402fe6629e72e9f3d9f94b9f0b1401e76c3c1f69dcc713d2da")

package() {
  # TODO: fix in upstream
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  # TODO: implement proper documentation in upstream
  mkdir -p "${pkgdir}/usr/share/man/man1"
  rst2man README.rst "${pkgdir}/usr/share/man/man1/${_basename}.1"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
