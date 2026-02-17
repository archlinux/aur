# Maintainer: Do1e <https://aur.archlinux.org/account/Do1e>

pkgname=python-njulogin
pkgver=4.0.0
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

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/bc/fb/42c6d483905f4399a776a6cc349f1e392b9011d3cc0145a64486b5e818ff/njulogin-4.0.0.tar.gz")
sha256sums=('13de1e00a683338ba92acc8fe66e4bafded08cf66ce3952ae9db67ba1b2c0c28')

build() {
  cd "njulogin-$pkgver"
  uv build
}

package() {
  cd "njulogin-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
