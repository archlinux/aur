# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=python-virtualenvwrapper
pkgver=6.0.0
pkgrel=1
pkgdesc="Extensions to Ian Bicking's virtualenv tool"
arch=('any')
url="https://virtualenvwrapper.readthedocs.io/"
license=('MIT')
depends=('python-virtualenv' 'python-virtualenv-clone' 'python-stevedore'
         'which')
makedepends=('python-pbr' 'python-setuptools')
source=(https://pypi.org/packages/source/v/virtualenvwrapper/virtualenvwrapper-$pkgver.tar.gz)
sha256sums=('4cdaca4a01bb11c3343b01439cf2d76ebe97bb28c4b9a653a9b1f1f7585cd097')

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
