# Maintainer: gilcu3 <gilcu3 at gmail dot com>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=('python-gtkspellcheck')
_pkgname='pygtkspellcheck'
pkgver=5.0.3
pkgrel=1
pkgdesc="Spell-checking library written in Python for Gtk based on Enchant"
arch=('any')
url="https://github.com/koehlma/pygtkspellcheck"
license=('GPL')
makedepends=('python-pyenchant' 'python-gobject' 'git' 'python-build' 'python-installer' 'python-wheel' 'python-poetry')
depends=('python-pyenchant' 'python-gobject')
provides=('python-gtkspell')
source=("https://github.com/koehlma/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('c630e4d2f9a18c7111cbc9838814c00ea2654a032f6b286c1ee24f7cf653c505a8d76f13069900ca27f4d25bd5b566b8e72d2edc203e7e1a26205bbe9572b060')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
