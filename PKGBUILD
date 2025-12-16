# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=python-virtualenvwrapper
pkgver=6.1.1
pkgrel=2
pkgdesc="Extensions to Ian Bicking's virtualenv tool"
arch=('any')
url="https://virtualenvwrapper.readthedocs.io/"
license=('MIT')
depends=('python-virtualenv' 'python-virtualenv-clone' 'python-stevedore'
         'which')
makedepends=('python-pbr' 'python-setuptools' 'python-setuptools-scm')
source=(https://pypi.org/packages/source/v/virtualenvwrapper/virtualenvwrapper-$pkgver.tar.gz)
sha256sums=('112e7ea34a9a3ce90aaea54182f0d3afef4d1a913eeb75e98a263b4978cd73c6')

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
