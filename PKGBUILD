# Maintainer: gilcu3 <gilcu3 at gmail dot com>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=('python-gtkspellcheck')
_pkgname='pygtkspellcheck'
pkgver=5.0.2
pkgrel=1
pkgdesc="Spell-checking library written in Python for Gtk based on Enchant"
arch=('any')
url="https://github.com/koehlma/pygtkspellcheck"
license=('GPL')
makedepends=('python-pyenchant' 'python-gobject' 'git' 'python-build' 'python-installer' 'python-wheel' 'python-poetry')
depends=('python-pyenchant' 'python-gobject')
provides=('python-gtkspell')
source=("https://github.com/koehlma/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('2589da0d1e241fdbe028bac92c539ba4aeba92c5f34669830bcb0e408e517e573e4f5bb68ec4628e38bfbe3b9d5b8e23694ee5c75aaaedbd58528bcc017d6797')

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
