# Maintainer: gilcu3 <gilcu3 at gmail dot com>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=('python-gtkspellcheck')
_pkgname='pygtkspellcheck'
pkgver=5.0.0
pkgrel=1
pkgdesc="Spell-checking library written in Python for Gtk based on Enchant"
arch=('any')
url="https://github.com/koehlma/pygtkspellcheck"
license=('GPL')
makedepends=('gtk3' 'python-pyenchant' 'gtk4' 'python-gobject' 'git' 'python-build' 'python-installer' 'python-wheel')
depends=('python-pyenchant' 'python-gobject')
provides=('python-gtkspell')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/koehlma/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('83febb27a5915841df993f5eef890a1cb8120cef3ca9bd81614c3dd837d611f9c368df2be866a61c6f9b135a583f64315527a586c98396d50c92dfd61d05a017')


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
