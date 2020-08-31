# Maintainer: erdii <me at erdii dot engineering>
pkgname=aws2-wrap
pkgver=1.1.0
pkgrel=1
pkgdesc="Simple script to export current AWS SSO credentials or run a sub-process with them"
arch=('any')
url="https://github.com/linaro-its/aws2-wrap"
license=('GPL3')
depends=('aws-cli')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")

sha256sums=('aeb5290517dced41f61e34bb8670e1e63ef83fc4b3c312125f28adeadeb053a8')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
