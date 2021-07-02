# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=python-google-cloud-speech
_name=google-cloud-speech
pkgver=2.5.0
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
b2sums=('4b7e4fe4f6ce09e4090445d8a2d0cbb4b09942ea6cbdb904b7b94a2d857d7b5fd88e1df95e246312e6783ec5ea99c106832fe8c070c3a06dba77d477c5480eb3')

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
