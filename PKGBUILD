# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>

pkgname=python2-nltk_contrib-git
_pkgname=nltk_contrib
pkgver=r59.c9da2c2
pkgrel=1
pkgdesc="Natural Language Toolkit, Contrib Area"
url="http://www.nltk.org/"
arch=('any')
license=('APACHE')
depends=('python2-nltk' 'git')
makedepends=('python2-setuptools')
source=('git+https://github.com/nltk/nltk_contrib.git')
sha1sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${_pkgname}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}
  python2 setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
