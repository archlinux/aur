# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=('python-gtkspellcheck' 'python2-gtkspellcheck')
pkgver=4.0.5
pkgrel=6
pkgdesc="Spell-checking library written in Python for Gtk based on Enchant"
arch=('any')
url="https://github.com/koehlma/pygtkspellcheck"
license=('GPL')
makedepends=('gtk3' 'python-pyenchant' 'python2-pyenchant' 'python-sphinx'
             'python2-sphinx' 'python-gobject' 'python2-gobject' 'git')
source=("pygtkspellcheck-${pkgver}.tar.gz::https://github.com/koehlma/pygtkspellcheck/archive/${pkgver}.tar.gz")
sha512sums=('f2ea035093a4d8bd9ca3b04f7433808b1ea8c3723b3ea12b95f470d8eb003c9cf58114cb4f342f36732ae46e6156223db5185f16a8c4b27551a6b99bc28a45b9')

package_python-gtkspellcheck() {
  depends=('python-pyenchant' 'python-gobject')

  cd "$srcdir/pygtkspellcheck"
  python3 setup.py install --root="$pkgdir" -O1
}

package_python2-gtkspellcheck() {
  depends=('python2-pyenchant' 'python2-gobject')
  provides=('python2-gtkspell')
  replaces=('python2-gtkspell')
  conflicts=('python2-gtkspell')

  cd "$srcdir/pygtkspellcheck"
  GTKSPELL=true python2 setup.py install --root="$pkgdir" -O1
}

# vim:set ts=2 sw=2 et:
