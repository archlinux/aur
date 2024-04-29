## UPSTREAM:
# Author: Guillaume Chazarain <guichaz<at>gmail<dot>com>
# Author: Enre Hasegeli <emre<at>hasegeli<dot>com>
# Author: Patrick Meyer <git<at>the-space<dot>agency>

## PACKAGE:
# Maintainer: Mike Sampson <mike at sambodata dot com>
# Maintainer: Mikhail f. Shiryaev <mr<dot>felixoid<at>gmail<dot>com>

pkgname=polysh
pkgver=0.14
pkgrel=2
pkgdesc="a tool to aggregate several remote shells into one."
arch=("any")
url="https://pypi.org/project/${pkgname}/"
license=("GPL2")
depends=("python" "openssh")
makedepends=("python-setuptools" "python-docutils")
options=(!emptydirs)
source=("https://github.com/innogames/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d49ea5e38d8b4d8abec7144ac3200e086420b679c5ea2dc886ba6189203d7ad2')

package() {
  # TODO: fix in upstream
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  # TODO: implement proper documentation in upstream
  mkdir -p "${pkgdir}/usr/share/man/man1"
  rst2man README.rst "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
