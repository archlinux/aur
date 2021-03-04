# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

pkgname=python-google-cloud-speech
_name=google-cloud-speech
pkgver=2.1.0
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
sha256sums=('4a77a79e990004af96e789565b174f9b971f00afa23142f6673722dae0910b0c')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
