# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=python-virtualenvwrapper
pkgver=6.1.0
pkgrel=3
pkgdesc="Extensions to Ian Bicking's virtualenv tool"
arch=('any')
url="https://virtualenvwrapper.readthedocs.io/"
license=('MIT')
depends=('python-virtualenv' 'python-virtualenv-clone' 'python-stevedore'
         'which')
makedepends=('python-pbr' 'python-setuptools' 'python-setuptools-scm')
source=(https://pypi.org/packages/source/v/virtualenvwrapper/virtualenvwrapper-$pkgver.tar.gz)
sha256sums=('d467beac5a44be00fb5cd1bcf332398c3dab5fb3bd3af7815ea86b4d6bb3d3a4')

prepare() {
  cd virtualenvwrapper-$pkgver
}

build() {
  cd virtualenvwrapper-$pkgver
  python3 setup.py build
}

package() {
  cd virtualenvwrapper-$pkgver
  python3 setup.py install --root="$pkgdir" -O1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
