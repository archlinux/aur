# Maintainer: Joost Bremmer <contact@madeofmagicandwires.online>
pkgname=pq-cli
pkgver=1.0.2
pkgrel=2
pkgdesc="Progress Quest: the CLI edition"
arch=('any')
url="https://github.com/rr-/pq-cli"
license=('MIT')
depends=('python'
         'python-urwid'
         'python-urwid_readline'
         'python-xdg-base-dirs')

makedepends=('python-build' 'python-installer' 'python-wheel')

_COMMIT="07cae1a4e8ef5e4404ae239a577d5330778fa0c0"
source=(${pkgname}.zip::"https://github.com/rr-/${pkgname}/archive/${_COMMIT}.zip")
sha512sums=('188938005b97aeae56fc19d06eec8b04d1480f8a1e5a2976e6f1225cff4bcfe0a7a0e5a089733b77b020c3a97d1724a98d7a98c828599f2cb90cecc03f0531d6')

build() {
  cd "${srcdir}/${pkgname}-${_COMMIT}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${_COMMIT}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: sw=2 ts=2 tw=80 et:
