pkgbase=python-pygments-style-solarized
pkgname=(python-pygments-style-solarized python2-pygments-style-solarized)
pkgver=0.1.1
pkgrel=1
pkgdesc="Pygments version of the Solarized theme"
arch=('any')
url="https://github.com/shkumagai/pygments-style-solarized"
license=('custom:MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/shkumagai/pygments-style-solarized/archive/$pkgver.tar.gz")
sha512sums=('076f4651cd9d4e1a4c74eea5ed2e0eadf7ec924f0b85386e71f2ec042f14c506405a6789528e2bd47fd914a23b27b52264c00e51d019bed3561f2dff958a7551')

prepare() {
  mv pygments-style-solarized-$pkgver python-pygments-style-solarized-$pkgver
  cp -a {python,python2}-pygments-style-solarized-$pkgver
}

package_python-pygments-style-solarized() {
  depends=("python-pygments")
  cd "$pkgname-$pkgver"

  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-pygments-style-solarized() {
  depends=("python2-pygments")
  cd "$pkgname-$pkgver"

  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
