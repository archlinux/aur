# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='procpath'
pkgver=1.11.1
pkgrel='2'
pkgdesc="A process tree analysis workbench"
arch=('any')
url="https://heptapod.host/saajns/procpath"
license=('LGPL-3.0-only')
depends=('python' 'python-jsonpyth' 'python-pygal')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}::hg+${url}#revision=${pkgver}")
sha512sums=('SKIP')

build() {
  cd "${pkgname}-${pkgver}"

  python setup.py build
}

# tests are disabled for now due to https://heptapod.host/saajns/procpath/-/issues/21
#check() {
#  cd "${pkgname}-${pkgver}"
#
#  python -m unittest
#}

package() {
  cd "${pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
