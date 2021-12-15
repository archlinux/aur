# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=python-nose
pkgver=1.3.7
pkgrel=13
pkgdesc="A discovery-based unittest extension"
arch=('any')
url='https://readthedocs.org/docs/nose/'
license=('LGPL2.1')
depends=('python' 'python-setuptools')
source=("https://pypi.python.org/packages/source/n/nose/nose-${pkgver}.tar.gz"{,.asc})
sha512sums=('e65c914f621f8da06b9ab11a0ff2763d6e29b82ce2aaed56da0e3773dc899d9deb1f20015789d44c65a5dad7214520f5b659b3f8d7695fb207ad3f78e5cf1b62'
            'SKIP')
validpgpkeys=('58B277C0D208F7AC460C07C84548B3A8C0D70C12') # John Szakmeister <john@szakmeister.net>

build() {
  cd "$srcdir/nose-$pkgver"
  sed -i -e "s:man/man1:share/man/man1:g" setup.py
}

package() {
  cd "$srcdir/nose-$pkgver"
  python3 setup.py install --prefix=/usr --root="${pkgdir}"
  ln -s nosetests "$pkgdir/usr/bin/nosetests3"
}
