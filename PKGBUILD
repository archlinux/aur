# Maintainer: erdii <me at erdii dot engineering>
# Maintainer: Alexander Bruegmann <mail at abruegmann dot eu>
pkgname=aws2-wrap
pkgver=1.1.7
pkgrel=2
pkgdesc="Simple script to export current AWS SSO credentials or run a sub-process with them"
arch=('any')
url="https://github.com/linaro-its/aws2-wrap"
license=('GPL3')
depends=('aws-cli' 'python-psutil')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('a25be206f47be23c8eb01b081e476ce44deb2b6cb44c6a5179019e00b16b6762')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
