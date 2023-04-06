# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Chris Billington <chrisjbillington@gmail.com>
# Contributor: Étienne Deparis <etienne@depar.is>

pkgname=python-inotify-simple
pkgver=1.3.5
pkgrel=4
pkgdesc='A simple Python wrapper around inotify'
arch=(any)
url=https://github.com/chrisjbillington/inotify_simple
license=(BSD)
depends=(python)
makedepends=(
  git
  python-setuptools
)
_tag=2a8f8305125c396896835f0ea4593477d007ff4b
source=(git+https://github.com/chrisjbillington/inotify_simple.git#tag=${_tag})
b2sums=(SKIP)

build() {
  cd inotify_simple
  python setup.py build
}

package() {
  cd inotify_simple
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python-inotify-simple/
}

# vim: ts=2 sw=2 et:
