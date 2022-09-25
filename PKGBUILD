# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

pkgname='procpath'
_commit='491eba08366067f7a3c904dda17c5c058e09fec5' # taken from https://heptapod.host/saajns/procpath/-/blob/branch/default/.hgtags
pkgver=1.6.1
pkgrel=1
pkgdesc="A process tree analysis workbench"
arch=('any')
url="https://heptapod.host/saajns/procpath"
license=('LGPL3')
depends=('python' 'python-jsonpyth' 'python-pygal')
makedepends=('mercurial' 'python-setuptools')
source=("${pkgname}-${pkgver}::hg+${url}#revision=${_commit}")
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

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
