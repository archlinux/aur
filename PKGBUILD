pkgname=yay-faster-cn
pkgver=0.2
pkgrel="3"
pkgdesc="Use github mirror to speed yay up in China."
arch=('any')
url="https://github.com/iamzhz/yay-faster-cn"
license=('MIT')


depends=('python' 'python-setuptools' 'git' 'wget' 'yay')
makedepends=('python-setuptools')


source=("https://github.com/iamzhz/yay-faster-cn/releases/download/v${pkgver}/yay_faster_cn_v${pkgver}.tar.gz")
sha256sums=('dd64b97ed3b167a3a303dced96823c94e1d53878b65d6e380f66f9e8eb72ebb0')

build() {
  cd "yay_faster_cn_v$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "yay_faster_cn_v$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}