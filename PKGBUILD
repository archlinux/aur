# Maintainer: gilcu3 <gilcu3 at gmail dot com>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=('python-gtkspellcheck')
_pkgname='pygtkspellcheck'
pkgver=5.0.1
pkgrel=2
pkgdesc="Spell-checking library written in Python for Gtk based on Enchant"
arch=('any')
url="https://github.com/koehlma/pygtkspellcheck"
license=('GPL')
makedepends=('python-pyenchant' 'python-gobject' 'git' 'python-build' 'python-installer' 'python-wheel' 'python-poetry')
depends=('python-pyenchant' 'python-gobject')
provides=('python-gtkspell')
source=("https://github.com/koehlma/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('f21cb7b1f38b84ae781bc7895572555769811458303957eafc91806834776d5a56bb6c77f805d2f2f36e428d4aac671734f963710c755c1075deaebe89b3f2d3')

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
