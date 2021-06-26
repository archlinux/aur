# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

pkgname=python-google-cloud-speech
_name=google-cloud-speech
pkgver=2.4.1
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
b2sums=('ff15dadbb30fdc8ccc2f62eac7c9689e745f3188287ec013888477cbf7402d3f5c3fc17e300cad82fe5483dd272859040db9b5239cef98de50bd42603b3e124e')

build() {
  cd "$_name-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
