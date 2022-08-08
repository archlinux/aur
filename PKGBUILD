# Maintainer: erdii <me at erdii dot engineering>
# Maintainer: Alexander Bruegmann <mail at abruegmann dot eu>
pkgname=aws2-wrap
pkgver=1.3.0
pkgrel=1
pkgdesc="Simple script to export current AWS SSO credentials or run a sub-process with them"
arch=('any')
url="https://github.com/linaro-its/aws2-wrap"
license=('GPL3')
depends=('aws-cli' 'python-psutil')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('8a24605c6fb073e4ffceb63000fa8acda8a1a4860807b16c9279bc64cf37baff')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
