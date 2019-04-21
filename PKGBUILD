# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Maximilian Köhl <linuxmaxi@googlemail.com>

pkgname=('python-gtkspellcheck' 'python2-gtkspellcheck')
pkgver=4.0.5
pkgrel=5
pkgdesc="Spell-checking library written in Python for Gtk based on Enchant"
arch=('any')
url="https://github.com/koehlma/pygtkspellcheck"
license=('GPL')
makedepends=('gtk3' 'python-pyenchant' 'python2-pyenchant' 'python-sphinx'
             'python2-sphinx' 'python-gobject' 'python2-gobject' 'git')
source=(git+https://github.com/koehlma/pygtkspellcheck.git#tag=$pkgver)
sha256sums=('SKIP')

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
