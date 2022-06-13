# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Konstantin Gizdov <arch@kge.pw>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=python2-nose
pkgver=1.3.7
pkgrel=5
pkgdesc="A discovery-based unittest extension"
arch=('any')
url='http://readthedocs.org/docs/nose/'
license=('LGPL2.1')
makedepends=('python2' 'python2-setuptools' 'python2-sphinx')
source=("https://pypi.python.org/packages/source/n/nose/nose-${pkgver}.tar.gz")
sha512sums=('e65c914f621f8da06b9ab11a0ff2763d6e29b82ce2aaed56da0e3773dc899d9deb1f20015789d44c65a5dad7214520f5b659b3f8d7695fb207ad3f78e5cf1b62')

build() {
  cd "$srcdir/nose-$pkgver"
  sed -i -e "s:man/man1:share/man/man1:g" setup.py
}

package() {
  depends=('python2' 'python2-setuptools')
  cd "$srcdir/nose-$pkgver"
  python2 setup.py install --prefix=/usr --root="${pkgdir}"
  mv "$pkgdir/usr/bin/nosetests" "$pkgdir/usr/bin/nosetests2"
  rm -rf "$pkgdir/usr/share"
}
