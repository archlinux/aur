# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Chris Billington <chrisjbillington@gmail.com>
# Contributor: Étienne Deparis <etienne@depar.is>

pkgname=python-inotify-simple
pkgver=2.0.1
pkgrel=5
pkgdesc='A simple Python wrapper around inotify'
arch=(any)
url=https://github.com/chrisjbillington/inotify_simple
license=(BSD-2-Clause)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=(git+https://github.com/chrisjbillington/inotify_simple.git#tag=${pkgver})
b2sums=('5b97415fb7db6f80ceb75ff89187645b38c76452f82c9b43a621bac6fe1335233af4f144e63a3c0f8efb72f9067ff47ef206b37be972452a446d76ed4e5bebde')

build() {
  cd inotify_simple
  python -m build --wheel --no-isolation
}

package() {
  cd inotify_simple
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python-inotify-simple/
}

# vim: ts=2 sw=2 et:
