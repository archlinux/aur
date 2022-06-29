# Maintainer: gilcu3 <gilcu3 at gmail dot com>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=('python-gtkspellcheck')
_pkgname='pygtkspellcheck'
pkgver=5.0.0
pkgrel=2
pkgdesc="Spell-checking library written in Python for Gtk based on Enchant"
arch=('any')
url="https://github.com/koehlma/pygtkspellcheck"
license=('GPL')
makedepends=('python-pyenchant' 'python-gobject' 'git' 'python-build' 'python-installer' 'python-wheel' 'python-poetry')
depends=('python-pyenchant' 'python-gobject')
provides=('python-gtkspell')
source=("git+https://github.com/koehlma/${_pkgname}#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
  cd "${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
