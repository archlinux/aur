# Maintainer: erdii <me at erdii dot engineering>
# Maintainer: Alexander Bruegmann <mail at abruegmann dot eu>
pkgname=aws2-wrap
pkgver=1.1.8
pkgrel=1
pkgdesc="Simple script to export current AWS SSO credentials or run a sub-process with them"
arch=('any')
url="https://github.com/linaro-its/aws2-wrap"
license=('GPL3')
depends=('aws-cli' 'python-psutil')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('ce21eb8dc9dcc0e704a73a67b57e35f61d91f137a86eb9addebacd64cf312086')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
