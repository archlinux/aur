# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-case
pkgver=1.5.3
pkgrel=10
pkgdesc="Python unittest Utilities"
arch=('any')
license=('BSD')
url="https://github.com/celery/case"
depends=('python-nose' 'python-setuptools' 'python-six')
source=("https://files.pythonhosted.org/packages/source/c/case/case-$pkgver.tar.gz")
sha512sums=('ae98a571c282f80c685c42ab1dc578847fe88cf8cd07faff505a8df8e3282a602908a8780ab88b36851e3ee6f3c178405e5c50776fd0f49fcc990087575f2958')

build() {
  cd case-$pkgver
  python setup.py build
}

package() {
  cd case-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
