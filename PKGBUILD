# Maintainer: erdii <me at erdii dot engineering>
pkgname=aws2-wrap
pkgver=1.1.4
pkgrel=1
pkgdesc="Simple script to export current AWS SSO credentials or run a sub-process with them"
arch=('any')
url="https://github.com/linaro-its/aws2-wrap"
license=('GPL3')
depends=('aws-cli')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")

sha256sums=('483a0e46c5d2417d2c7d07d1076823465d0e4388127c2e1c4f345320ffc7d6eb')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
