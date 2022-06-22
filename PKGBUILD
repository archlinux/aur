# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: Peter Baldwin <bald_pete@hotmail.com>

pkgname=python2-jinja
pkgver=2.11.3
pkgrel=5
pkgdesc="A simple pythonic template language written in Python"
arch=('any')
url="https://palletsprojects.com/p/jinja/"
license=('BSD')
#depends=('python2-markupsafe')
makedepends=('python2-setuptools')
optdepends=('python2-babel: for i18n support')
source=(https://files.pythonhosted.org/packages/source/J/Jinja2/Jinja2-$pkgver.tar.gz)
sha256sums=('a6d58433de0ae800347cab1fa3043cebbabe8baa9d29e668f1c768cb87a333c6')

build() {
  cd Jinja2-$pkgver
  python2 setup.py build
}

package() {
  cd Jinja2-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
