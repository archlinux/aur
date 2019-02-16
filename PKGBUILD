# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Wieland Hoffmann <the_mineo@web.de>
# Contributor: Amr Hassan <amr.hassan@gmail.com>

pkgname=python2-pylast
pkgver=2.4.0
pkgrel=3
pkgdesc='A Python interface to Last.fm and Libre.fm (for python2)'
arch=('any')
url='https://github.com/pylast/pylast'
license=('Apache')
depends=('python2-six')
makedepends=('python2-setuptools') #'git'
source=("${pkgname/python2-/}-${pkgver}.tar.gz::https://github.com/pylast/pylast/archive/${pkgver}.tar.gz")
#source=("git+https://github.com/pylast/pylast.git#tag=${pkgver}")
sha256sums=('28f4a3ecb7c46a03ac3bf7b203d7702f4d89460b80dd15e807fbef09902746da')

build() {
  cd "${pkgname/python2-/}-${pkgver}"
  python2 ./setup.py build
}

package() {
  cd "${pkgname/python2-/}-${pkgver}"
  python2 ./setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
