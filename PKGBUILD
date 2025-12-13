# Maintainer: Joost Bremmer <contact@madeofmagicandwires.online>
pkgname=pq-cli
pkgver=1.0.4
pkgrel=1
pkgdesc="Progress Quest: the CLI edition"
arch=('any')
url="https://github.com/rr-/pq-cli"
license=('MIT')
depends=('python'
         'python-urwid'
         'python-urwid_readline'
         'python-xdg-base-dirs')

makedepends=('python-build' 'python-hatchling' 'python-installer')

source=("${pkgname}.tar.gz::https://github.com/rr-/pq-cli/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('8a1bfaa9d67ad2e28d5a5053f8ef99fd748de2d743f87f5abcb1bebd221fa7563603238a8e98c6380b2ab48ecfb7fc9e949736ac05f2cfb4be014465e45bc595')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: sw=2 ts=2 tw=80 et:
