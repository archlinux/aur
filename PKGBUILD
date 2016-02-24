# $Id$
# Maintainer: Arthur Vuillard <arthur@hashbang.fr>

_pkgbase="joe"
pkgname="python2-${_pkgbase}"
pkgver="0.0.7"
pkgrel=2
pkgdesc="A .gitignore magician in your command line"
arch=('any')
url="http://github.com/karan/joe/"
license=('MIT')
depends=('python2' 'python2-docopt' 'python2-git')
provides=('joe')
makedepends=('python2-setuptools')
source=("https://github.com/karan/joe/archive/${pkgver}.tar.gz")
md5sums=('f10faf7246f3938870383559a0ac28a7')

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py test
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py install -O1 --prefix=/usr --root="$pkgdir/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
