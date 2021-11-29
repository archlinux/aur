# Maintainer: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Schala <schalaalexiazeal@gmail.com>

pkgname=python2-enum34
pkgver=1.1.9
pkgrel=1
pkgdesc='Python 3.4 Enum backported'
arch=(any)
url=https://bitbucket.org/stoneleaf/enum34
license=(BSD)
depends=(python2)
makedepends=(
  mercurial
  python2-setuptools
)
source=(hg+https://bitbucket.org/stoneleaf/enum34#tag=7e3b107656eb)
sha256sums=(SKIP)

pkgver() {
  cd enum34

  hg id -t
}

build() {
  cd enum34

  python2 setup.py build
}

package() {
  cd enum34

  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 enum/LICENSE -t "${pkgdir}"/usr/share/licenses/python2-enum34/
}

# vim: ts=2 sw=2 et:
