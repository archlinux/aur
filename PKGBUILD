# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=python-d2to1
pkgver=0.2.12.post1
pkgrel=12
pkgdesc="Python library that allows using distutils2-like setup.cfg files for a package's metadata with a distribute/setuptools setup.py script"
arch=('any')
url='https://pypi.python.org/pypi/d2to1'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/d/d2to1/d2to1-$pkgver.tar.gz)
sha512sums=('89890afc78b21d78f42ef5c920d377cd58075829e025c512d86138d52943ce8b71d1245bf267f76f775c6a69bf81bf9881322bd64b0e75ae088134e6b66f4d2d')

build() {
  cd d2to1-$pkgver
  python setup.py build
}

package() {
  cd d2to1-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
