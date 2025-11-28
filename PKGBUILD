# Maintainer: Do1e <https://aur.archlinux.org/account/Do1e>

pkgname=python-njulogin
pkgver=3.6.1
pkgrel=1
pkgdesc="The Nanjing University login module, which can be used to login to the various campus web sites"
arch=('any')
url='https://github.com/Do1e/NJUlogin'
license=('MIT')
depends=(
  'python>=3.10'
  'python-requests>=2.32.0'
  'python-pillow>=11.0.0'
  'python-numpy>=2.0.0'
  'python-lxml>=5.3.0'
  'python-pycryptodome>=3.21.0'
  'python-onnxruntime>=1.20.0'
  'python-cryptography>=43.0.0'
)
makedepends=(uv)

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/5c/13/4df6f4804ae8029092ac4fb87f0864ec0437372c16c85a192b2b6f893dd1/njulogin-3.6.1.tar.gz")
sha256sums=('ba3a25ed08aaf1220c6771cc8f35ca2ffe3cec738d3fbd1fccfb8f69e1030fd2')

build() {
  cd "njulogin-$pkgver"
  uv build
}

package() {
  cd "njulogin-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
