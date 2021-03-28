# Maintainer: Tim Sweet <tsweet64@protonmail.com>

pkgname=mansnip-kristopolous
pkgver=0.3.7
pkgrel=1
pkgdesc='Finds just the snippets in man page you care about'
arch=('any')
url='https://github.com/kristopolous/mansnip'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('910df5445bca4976e60cb852376b684a5ace11451de6e75847eeff7e69852199333cedcac36e473feab317399b47851ef7f51a19db7c30965d29d6b2827ee687')
build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
}
