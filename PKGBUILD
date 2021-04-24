# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

pkgname=python-google-cloud-speech
_name=google-cloud-speech
pkgver=2.3.0
pkgrel=1
pkgdesc="A google cloud speech api for python to convert audio to text."
arch=('any')
url="https://github.com/googleapis/python-speech"
license=('Apache')
depends=('python-libcst'
  'python-proto-plus'
  'python-google-api-core')
makedepends=('python'
  'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('ec1f87c202478cf2f7c9e14b53cdf7b970b532f1b451a23106643ce95b8dda6c')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
