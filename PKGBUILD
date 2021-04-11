# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

pkgname=python-google-cloud-speech
_name=google-cloud-speech
pkgver=2.2.1
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
sha256sums=('02f8980c8ebc675d4cfeba878104d0ba060d7a63d30399d6e1a5504e2c0c6312')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
