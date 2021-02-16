# Maintainer: gilcu3 <gilcu3 at gmail dot com>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=('python-gtkspellcheck' 'python2-gtkspellcheck')
pkgver=4.0.6
pkgrel=1
pkgdesc="Spell-checking library written in Python for Gtk based on Enchant"
arch=('any')
url="https://github.com/koehlma/pygtkspellcheck"
license=('GPL')
makedepends=('gtk3' 'python-pyenchant' 'python2-pyenchant' 'python-gobject' 'python2-gobject' 'git')
optdepends=('python-sphinx' 'python2-sphinx')
source=("pygtkspellcheck-${pkgver}.tar.gz::https://github.com/koehlma/pygtkspellcheck/archive/v${pkgver}.tar.gz")
sha512sums=('682b618e8f22aa69d971d332329cbde96cec94320b0a7c35cf04aa72c07f3ab6b39ac9a41afdf8d1b9f06fc74abeff0e7685bd3ecf6020c6f36fd4775e58f093')

package_python-gtkspellcheck() {
  depends=('python-pyenchant' 'python-gobject')

  cd "${srcdir}/pygtkspellcheck-${pkgver}"
  python3 setup.py install --root="${pkgdir}" -O1
}

package_python2-gtkspellcheck() {
  depends=('python2-pyenchant' 'python2-gobject')
  provides=('python2-gtkspell')
  replaces=('python2-gtkspell')
  conflicts=('python2-gtkspell')

  cd "${srcdir}/pygtkspellcheck-${pkgver}"
  GTKSPELL=true python2 setup.py install --root="${pkgdir}" -O1
}

# vim:set ts=2 sw=2 et:
