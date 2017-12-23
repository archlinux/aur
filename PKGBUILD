# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=python-sympy-docs
pkgver=1.1.1
pkgrel=1
pkgdesc="Documentation for Python Sympy module."
arch=('any')
url="http://www.sympy.org/"
license=('BSD')
options=('docs')
makedepends=('python-sphinx' 'librsvg' 'imagemagick')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sympy/sympy/releases/download/sympy-$pkgver/sympy-$pkgver.tar.gz")
sha256sums=('ac5b57691bc43919dcc21167660a57cc51797c28a4301a6144eff07b751216a4')

build() {
  cd "sympy-$pkgver/doc"
  make html
}

package() {
  mkdir -p $pkgdir/usr/share/doc/python-sympy
  cd "sympy-$pkgver/doc/_build"
  cp -a ./html $pkgdir/usr/share/doc/python-sympy/
}
# vim:set ts=2 sw=2 et:
